Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  post "bookings", to: "pages#create"
  resources :shows do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :update, :destroy]
  get "dashboard", to: "pages#dashboard"
  get "dashboard/user_shows", to: "pages#dashboard"
  get "dashboard/bookings", to: "pages#dashboard"
end
