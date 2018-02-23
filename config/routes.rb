Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  get 'login' => 'credentials#index'

  get 'profile' => 'users#profile'
  get 'profile/edit' => 'users#edit'
  patch 'profile/update' => 'users#update'

  get 'confirm/:token', to: 'registration#confirm', as: 'confirm'
  get 'send-confirm' => 'registration#signup_email'
  get 'signup' => 'registration#index'
  post 'registration/create'

  resources :users, only: %i[index] do
    collection do
      get :me
    end
  end
  resources :addresses
  resources :credentials, only: %i[create destroy]
end
