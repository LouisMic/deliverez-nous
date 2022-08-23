Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :shows do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :update, :destroy]
  get "dashboard/seller", to: "pages#seller"
  get "dashboard/buyer", to: "pages#buyer"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
