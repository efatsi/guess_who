class GamesController < ApplicationController
  def index
  end

  def show
  end

  def create
    game = Game.create

    Pusher.trigger("game", "update", game.reload.as_json)

    redirect_to game
  end

  def choose
    AnswerHandler.new(game, params[:answer]).process

    Pusher.trigger("game", "update", game.reload.as_json)

    redirect_to game
  end

  private

  helper_method :game
  def game
    @game ||= Game.find(params[:id])
  end
end
