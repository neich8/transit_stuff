Rails.application.routes.draw do

  root to: "routes#index"

  resources :routes
  get '/stations/:id', to: 'stations#schedule'
end
