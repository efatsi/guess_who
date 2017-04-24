class AlexaResponse
  class InvalidAnswer < StandardError; end

  attr_reader :game, :params

  def initialize(game, params)
    @game   = game
    @params = params
  end

  def as_json(opts = {})
    response.build_response(session_end = game.done)
  end

  def process
    handle_incoming
    push_update
    build_response
  rescue InvalidAnswer => e
    add_speech(e.message)
  rescue => e
    add_speech("Sorry, I couldn't understand what you said., #{game.current_question}")
  ensure
    response.add_session_attribute("game_id", game.id)
    response.build_session
  end

  private

  def handle_incoming
    return if new_session?

    skipping? ? handle_skip : handle_answer
  end

  def handle_skip
    AnswerHandler.new(game, nil).process
  end

  def push_update
    Pusher.trigger("game", "update", game.reload.as_json)
  end

  def handle_answer
    question = game.current_question
    answer   = question.answers.find_by(title: incoming)

    if answer.present?
      AnswerHandler.new(game, answer).process
    else
      # Todo: switch off of `incoming` to fine tune message
      raise InvalidAnswer.new("I couldn't make out what you said, #{question}")
    end
  end

  def build_response
    if game.reload.done
      add_speech("Well, looks like it's #{game.winner}")
    else
      next_question = game.current_question

      if new_session?
        add_speech("Here we go! #{next_question}")
      elsif skipping?
        add_speech("No problem, that was a dumb question anyway. #{next_question}")
      else
        add_speech("Great! #{next_question}")
      end
    end
  end

  def add_speech(words)
    response.add_speech(words)
    response.add_reprompt(words)
  end

  def skipping?
    @skipping ||= params["request"]["intent"]["name"] == "Skip"
  rescue
    false
  end

  def incoming
    @incoming ||= AnswerParser.new(params).parsed
  rescue
  end

  def response
    @response ||= AlexaRubykit::Response.new
  end

  def new_session?
    params["session"]["new"]
  end
end
