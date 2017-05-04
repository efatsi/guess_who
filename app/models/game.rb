class Game < ApplicationRecord
  belongs_to :current_question, class_name: "Question", optional: true

  before_create :set_possible_ids
  before_validation :set_first_question, on: :create
  before_validation :check_for_done

  def self.wait
    Pusher.trigger(PUSHER_GROUP, "wait", {})
  end

  def as_json(opts = {})
    {
      people: PeopleJson.new(self).as_json,
      status: done ? "done" : "playing"
    }
  end

  def is_done?
    done? || current_question.nil?
  end

  def winner
    Person.find_by(id: possible_ids.first)
  end

  def possible_people
    Person.where(id: possible_ids)
  end

  def set_possible_ids
    self.possible_ids = Person.pluck(:id)
  end

  def set_first_question
    self.current_question = QuestionPicker.new(self).first_question
  end

  def check_for_done
    if possible_ids.length == 1
      self.done = true
    end
  end
end
