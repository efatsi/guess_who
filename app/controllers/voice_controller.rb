class VoiceController < ApplicationController
  skip_before_action :verify_authenticity_token

  def handle
    game = begin
      Game.find_by(id: params["session"]["attributes"]["game_id"]) || Game.create
    rescue
      Game.create
    end

    response = AlexaResponse.new(game, params)
    response.process

    render json: response.as_json
  end
end
