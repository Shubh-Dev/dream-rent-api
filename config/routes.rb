Rails.application.routes.draw do
  get 'houses/index'
  get 'houses/show'
  get 'houses/new'  
  get 'houses/create'
  get 'houses/destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :houses
  # Defines the root path route ("/")
  root to: 'houses#index'

  namespace :api do
    namespace :v1 do
      post 'users/login'
      post 'users/register'

      resources :houses
    end
  end
end
