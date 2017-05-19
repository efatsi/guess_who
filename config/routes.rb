Rails.application.routes.draw do
  root to: "games#index"

  resources :games, only: [:index, :show, :create]
  post "/games/:id/choose", to: "games#choose", as: :choose

  get "/info", to: "api#index"
  get "/pics", to: "api#pics"

  post "/voice", to: "voice#handle"

  match '*all', to: 'cors#info', via: :options
end
