class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  validates :title, presence: true

  scope :specific,     -> { where(specific: true) }
  scope :non_specific, -> { where(specific: false) }

  def self.for_game(game)
    where.not(id: game.asked_question_ids).select do |question|
      count = 0

      question.answers.each do |answer|
        if answer.people.where(id: game.possible_ids).any?
          count += 1
        end
      end

      count >= 2
    end.sample
  end

  def to_s
    title
  end
end
