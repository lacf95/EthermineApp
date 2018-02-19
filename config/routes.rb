Rails.application.routes.draw do
  get 'home/index'
  get 'signup' => 'registration#index'
  post 'registration/create'
  root 'home#index'
  get 'login' => 'credentials#index'
  get 'confirm/:token' => 'registration#confirm'
  get 'send-confirm' => 'registration#signup_email'
  resources :users, only: %i[index]
  resources :addresses
  resources :credentials, only: %i[create destroy]
  resources :addresses
end
