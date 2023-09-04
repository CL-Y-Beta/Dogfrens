Rails.application.routes.draw do
  devise_for :users,
             path: "users",
             path_names: {
               edit: 'my-account',
               show: ''
             },
             controllers: {
               registrations: 'users/registrations',
               passwords: 'users/passwords'
             }

  devise_scope :user do
    get "users/my-account/password", to: "users/passwords#index", as: :change_password
    get 'users/edit-profile', to: 'users/registrations#edit_profile', as: :edit_profile
    # patch 'users/edit-profile', to: 'users/registrations#update_profile', as: :update_profile
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "listings#home"
  resources :listings
  # do
  #   post 'bookmark', to: 'bookmarks#create', on: :member
  # end

  get "/my-listings", to: "listings#my_listings"
  ## listings need to have a /my-listings to fetch the current-user's own postings/listings
  resources :bookings, only: %i[show create]
  get "/my-bookings-as-seller", to: "bookings#seller_index", as: :seller_bookings
  patch "/my-bookings-as-seller/:id", to: "bookings#accept", as: :accept_booking
  get "/my-bookings-as-buyer", to: "bookings#buyer_index", as: :buyer_bookings
  ## bookings index have to be /my-bookings/seller & my-bookings/buyer

  resources :users, only: %i[show]
  # resources :users, only: %i[new show create edit update destroy]

  # patch "/my-account", to: "users#update_account", as: :update_account
  ## From master branch, I'm just commenting out the code because I'm not sure if /my-account is needed.
  # resources :users, only: %i[show create edit update destroy]
  # get "/my-account", to: "users#my_account", as: :my_account


  # patch "/my-account/password", to: "users#change_password", as: :change_password_patch

  resources :bookmarks, only: %i[new create index destroy]
  ## bookmarks also need a /my_bookmarks
  # resources :discounts, only: %i[new create]

  ## USER needs a profile page
  ## User needs an edit
end
