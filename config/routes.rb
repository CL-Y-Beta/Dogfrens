Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "listings#home"
  resources :listings
  get "/my-listings", to: "listings#my_listings"
  ## listings need to have a /my-listings to fetch the current-user's own postings/listings
  resources :bookings, only: %i[show create]
  get "/my-bookings-as-seller", to: "bookings#seller_index", as: :seller_bookings
  get "/my-bookings-as-buyer", to: "bookings#buyer_index", as: :buyer_bookings
  ## bookings index have to be /my-bookings/seller & my-bookings/buyer
  resources :bookmarks, only: %i[new create index destroy]
  ## bookmarks also need a /my_bookmarks
  # resources :discounts, only: %i[new create]

  ## USER needs a profile page
  ## User needs an edit
end
