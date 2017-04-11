Rails.application.routes.draw do
  root to: "games#index"

  resources :games, only: [:index, :show, :create]
  post "/games/:id/choose", to: "games#choose", as: :choose
end
