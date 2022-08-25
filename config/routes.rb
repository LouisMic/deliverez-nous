Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :shows
  resources :bookings, only: [:create, :index, :update, :destroy]
  get "dashboard", to: "pages#dashboard"
  get "dashboard/user_shows", to: "pages#dashboard"
  get "dashboard/bookings", to: "pages#dashboard"
end
