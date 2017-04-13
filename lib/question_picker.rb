class QuestionPicker

  attr_reader :game

  def initialize(game)
    @game = game
  end

  def first_question
    Question.first
  end

  def new_question
    Question.where.not(id: game.asked_question_ids).sample
  end
end
