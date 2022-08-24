Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :shows do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :update, :destroy]
  get "dashboard", to: "pages#dashboard"
  get "dashboard/:seller", to: "pages#dashboard", as: :dashboard_seller
  get "dashboard/bookings", to: "pages#booking"
end
