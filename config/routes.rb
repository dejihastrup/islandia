Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :islands do
    resources :bookings, only: [:new, :create]
  end

  get '/my_islands', to: 'islands#my_islands'

  resources :bookings, only: [:index, :show]
end
