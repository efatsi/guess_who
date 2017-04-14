class ApiController < ApplicationController
  before_action :verify_authenticity_token

  def index
    render json: game.as_json
  end

  def pics
    render json: Person.picture_json
  end

  private

  def game
    @game ||= Game.last
  end
end
