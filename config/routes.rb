Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "listings#home"
  resources :listings
  resources :users, only: %i[new show create edit update destroy]
  resources :bookmarks, only: %i[new create index destroy]
  resources :discounts, only: %i[new create]
end
