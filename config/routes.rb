Rails.application.routes.draw do
  get 'home/index'
  get 'signup' => 'registration#index'
  post 'registration/create'
  root 'home#index'
  get 'login' => 'credentials#index'
  resources :users, only: %i[index]
  resources :addresses
  resources :credentials, only: %i[create destroy]
  resources :addresses
end
