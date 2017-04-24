class QuestionPicker

  attr_reader :game

  def initialize(game)
    @game = game
  end

  def first_question
    Question.all.select do |question|
      question.answers.all? do |answer|
        answer.people.count > 20
      end
    end.sample
  end

  def new_question
    if game.possible_ids.count <= 3
      specific_question || non_specific_question
    else
      non_specific_question || specific_question
    end
  end

  def specific_question
    Question.specific.for_game(game)
  end

  def non_specific_question
    Question.non_specific.for_game(game)
  end
end
