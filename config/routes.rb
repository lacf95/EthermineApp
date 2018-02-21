Rails.application.routes.draw do
  get 'home/index'
  get 'signup' => 'registration#index'
  post 'registration/create'
  root 'home#index'
  get 'login' => 'credentials#index'
  get 'confirm/:token', to: 'registration#confirm', as: 'confirm'
  get 'send-confirm' => 'registration#signup_email'
  get 'profile' => 'users#profile'
  get 'profile/edit' => 'users#edit'
  put 'profile/update' => 'users#update'
  patch 'profile/update' => 'users#update'
  resources :users, only: %i[index]
  resources :addresses
  resources :credentials, only: %i[create destroy]
  resources :addresses
end
