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
    answer = game.current_question.answers.find_by(id: params[:answer])

    AnswerHandler.new(game, answer).process
    Pusher.trigger("game", "update", game.reload.as_json)

    redirect_to game
  end

  private

  helper_method :game
  def game
    @game ||= Game.find(params[:id])
  end
end
