Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  get 'login' => 'credentials#index'
  get 'profile' => 'users#profile'
  get 'profile/edit' => 'users#edit'

  get 'confirm/:token', to: 'registration#confirm', as: 'confirm'
  get 'send-confirm' => 'registration#signup_email'
  get 'signup' => 'registration#index'
  post 'registration/create'

  resources :users, only: %i[index update]
  resources :addresses
  resources :credentials, only: %i[create destroy]
end
