Rails.application.routes.draw do
  get 'home/index'
  get 'signup' => 'registration#index' 
  post 'registration/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :credentials, only: %i[index create]
end
