class AlexaResponse
  class InvalidAnswer < StandardError; end

  attr_reader :game, :params, :last_question

  def initialize(game, params)
    @game          = game
    @params        = params
    @last_question = game.current_question
  end

  def as_json(opts = {})
    response.build_response(session_end = game.is_done?)
  end

  def process
    handle_incoming
    push_update
    build_response
  rescue InvalidAnswer => e
    add_speech(e.message)
  rescue => e
    raise e if Rails.env.development?
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
      raise InvalidAnswer.new("I couldn't make out what you said, #{question}")
    end
  end

  def build_response
    if game.reload.done
      if last_question.specific? && incoming == "no"
        no_person = last_question.answers.find_by(title: "yes").people.first
        add_speech(
          [
            "Okay, at least we can rule out #{no_person}.",
            "Well we can eliminate #{no_person} then.",
          ].sample + [
            " Looks like it's #{game.winner}.",
            " So it must be #{game.winner}.",
          ].sample
        )
      else
        add_speech [
          "I knew it was #{game.winner} all along!",
          "It's #{game.winner} isn't it?!",
          "I know who it is now. It's #{game.winner}!",
          "Ah Ha! It's #{game.winner}!",
          "Do you always think about #{game.winner} in your free time?"
        ].sample
      end
    else
      next_question = game.current_question

      if next_question.present?
        if new_session?
          add_speech("Here we go! #{next_question}")
        elsif skipping?
          add_speech [
            "No problem, that was a dumb question anyway. #{next_question}",
            "No problem. #{next_question}",
            "We'll just skip that one then. #{next_question}",
          ].sample
        else
          if last_question.specific?
            specific_person = last_question.answers.find_by(title: "yes").people.first

            add_speech [
              "Honestly, I knew it wasn't #{specific_person}, I just wanted to ask you that question. #{next_question}",
              "Okay, at least we can rule out #{specific_person}. #{next_question}",
              "So it's not #{specific_person} - got it. Okay. #{next_question}",
              "Awww. I was hoping it was #{specific_person}. Let's see if you picked someone better. #{next_question}",
              "Well we can eliminate #{specific_person} then. #{next_question}",
            ].sample
          else
            if (rand < 0.05)
              add_speech "Hot, diggity, damn! #{next_question}"
            else
              add_speech [
                "Great! #{next_question}",
                "Sounds good! #{next_question}",
                "Interesting! #{next_question}",
                "Well then, #{next_question}",
                "Okay then, #{next_question}",
                "That cuts a few people out, #{next_question}",
                "Wonderful! #{next_question}",
              ].sample
            end
          end
        end
      else
        add_speech "Well I'm out of ideas, you should get to know your coworkers better!"
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
