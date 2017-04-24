class Game < ApplicationRecord
  belongs_to :current_question, class_name: "Question", optional: true

  before_create :set_possible_ids
  before_validation :set_first_question, on: :create
  before_validation :check_for_done

  def self.wait
    Pusher.trigger("game", "wait", {})
  end

  def as_json(opts = {})
    {
      answers: current_question ? current_question.answers.as_json : [],
      done:    done,
      waiting: false,
      people:  PeopleJson.new(self).as_json
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
