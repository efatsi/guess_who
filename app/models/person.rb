class Person < ApplicationRecord
  include ActionView::Helpers::AssetUrlHelper

  has_many :person_answers
  has_many :answers, through: :person_answers

  validates :name, presence: true

  scope :by_name, -> { order(:name) }

  def self.picture_json
    all.map do |person|
      {
        url: person.url
      }
    end
  end

  def to_s
    name
  end

  def slug
    name.parameterize.underscore
  end

  def as_json(opts = {})
    {
      id:   id,
      slug: slug,
      url:  url
    }
  end

  def url
    "https://guess-whoo.herokuapp.com" + image_url("#{slug}.jpg")
  end
end
