Rails.application.routes.draw do
  resources :cheeses
  resources :categories
  root "home#index"
end
