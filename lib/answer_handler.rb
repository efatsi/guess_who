class AnswerHandler

  attr_reader :game, :current_question, :answer

  def initialize(game, answer)
    @game             = game
    @current_question = @game.current_question
    @answer           = answer
  end

  def process
    if answer.present?
      game.possible_ids       =  new_possible_ids
    end

    game.asked_question_ids << current_question.id
    game.current_question   =  question_picker.new_question

    game.save
  end

  def new_possible_ids
    answer.people.pluck(:id).select do |id|
      id.in? game.possible_ids
    end
  end

  def question_picker
    QuestionPicker.new(game)
  end
end
