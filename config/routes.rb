Rails.application.routes.draw do
  get 'home/index'
  get 'signup' => 'registration#index' 
  post 'registration/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'login' => 'credentials#index'
  resources :credentials, only: %i[create]
end
