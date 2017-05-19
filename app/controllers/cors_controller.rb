class CorsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def info
    render text: ""
  end
end
