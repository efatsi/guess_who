class Person < ApplicationRecord
  has_many :person_answers
  has_many :answers, through: :person_answers

  validates :name, presence: true

end
