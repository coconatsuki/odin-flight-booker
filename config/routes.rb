Rails.application.routes.draw do
  root   'flights#index'

  resources :flights
  resources :bookings, only: [:new, :create, :show]

  resources :charges, only: [:new, :create]

end
