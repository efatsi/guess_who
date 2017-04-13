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
    handle_answer
    push_update
    build_response
  rescue InvalidAnswer => e
    response.add_speech(e.message)
  ensure
    response.add_session_attribute("game_id", game.id)
    response.build_session
  end

  private

  def handle_answer
    return if new_session?

    question = game.current_question
    incoming = AnswerParser.new(params).parsed
    answer   = question.answers.find_by(title: incoming)

    if answer.present?
      AnswerHandler.new(game, answer).process
    else
      # Todo: switch off of `incoming` to fine tune message
      raise InvalidAnswer.new("I couldn't make out what you said, #{question}")
    end
  end

  def push_update
    Pusher.trigger("game", "update", game.reload.as_json)
  end

  def build_response
    if game.reload.done
      response.add_speech("Well, looks like it's #{game.winner}")
    else
      next_question = game.current_question
      if new_session?
        response.add_speech("Here we go! #{next_question}")
      else
        response.add_speech("Great! #{next_question}")
      end
    end
  end

  def response
    @response ||= AlexaRubykit::Response.new
  end

  def new_session?
    params["session"]["new"]
  end
end
