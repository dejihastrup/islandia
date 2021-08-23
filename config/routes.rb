Rails.application.routes.draw do
  devise_for :installs
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :show, :edit, :update]

  resources :islands, only: [:index, :show, :new, :create, :edit, :update]
  resources :bookings, only: [:index, :show, :edit]


  resources :islands, only: [:index] do
      resources :bookings, only: [:new, :create]
  end
end
