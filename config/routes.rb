Rails.application.routes.draw do
  devise_for :users
  root to: "parking_slots#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :parking_slots, only: [:create, :index, :show, :destroy]
end
