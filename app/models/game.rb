class Game < ApplicationRecord
  belongs_to :current_question, class_name: "Question", optional: true

  before_create :set_possible_ids
  before_validation :set_first_question, on: :create
  before_validation :check_for_done

  validates :current_question, presence: true, unless: :done?

  def set_possible_ids
    self.possible_ids = Person.pluck(:id)
  end

  def set_first_question
    self.current_question = QuestionPicker.new(self).new_question
  end

  def check_for_done
    if possible_ids.length == 1
      self.done = true
    end
  end
end
