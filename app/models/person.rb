class Person < ApplicationRecord
  include ActionView::Helpers::AssetUrlHelper

  has_many :person_answers
  has_many :answers, through: :person_answers

  validates :name, presence: true

  def slug
    name.parameterize.underscore
  end

  def as_json(opts = {})
    {
      id:  id,
      url: image_url("#{slug}.jpg")
    }
  end
end
