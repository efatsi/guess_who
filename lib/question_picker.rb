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
    Question.where.not(id: game.asked_question_ids).select do |question|
      count = 0

      question.answers.each do |answer|
        if answer.people.where(id: game.possible_ids).any?
          count += 1
        end
      end

      count >= 2
    end.sample
  end
end
