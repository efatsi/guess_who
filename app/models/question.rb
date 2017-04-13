class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

  validates :title, presence: true

  def to_s
    title
  end
end
