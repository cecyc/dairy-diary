Rails.application.routes.draw do
  devise_for :users
  get 'cheeses/latest', to: "cheeses#latest", as: "latest_cheeses"
  resources :cheeses
  resources :categories
  root "home#index"
end
