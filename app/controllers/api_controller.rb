class ApiController < ApplicationController
  def index
    render json: game.as_json
  end

  private

  def game
    @game ||= Game.last
  end
end
