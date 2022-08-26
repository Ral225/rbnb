Rails.application.routes.draw do
  devise_for :users
  get "/my-bookings", to: "pages#my_bookings"
  get "/my-listings", to: "pages#my_listings"
  get "/my-pending-requests", to: "pages#my_requests"
  root to: "parking_slots#index"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :parking_slots, only: [:new, :create, :index, :show, :destroy] do
    resources :rental_requests, only: [:new, :create, :destroy]
  end
  # resources :users
end
