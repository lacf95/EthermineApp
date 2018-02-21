Rails.application.routes.draw do
  get 'home/index'
  get 'signup' => 'registration#index'
  post 'registration/create'
  root 'home#index'
  get 'login' => 'credentials#index'
  get 'confirm/:token', to: 'registration#confirm', as: 'confirm'
  get 'send-confirm' => 'registration#signup_email'
  get 'users/:id' => 'users#show'
  resources :users, only: %i[index edit update show]
  resources :addresses
  resources :credentials, only: %i[create destroy]
  resources :addresses
end
