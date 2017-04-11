class Answer < ApplicationRecord
  belongs_to :question

  has_many :person_answers
  has_many :people, through: :person_answers

  validates :title, :question, presence: true
end
