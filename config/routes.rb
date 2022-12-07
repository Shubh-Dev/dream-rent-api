Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get 'appointments/index'
  get 'appointments/show'
  get 'appointments/new'
  post 'appointments/create'
  get 'houses/index'
  get 'houses/show'
  get 'houses/new'  
  get 'houses/create'
  get 'houses/destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :houses
  # resources :appointments, %i[index new show create]
  # Defines the root path route ("/")
  root to: 'houses#index'

  namespace :api do
    namespace :v1 do
      post 'users/login'
      post 'users/register'
      get 'users/index'

      resources :appointments
      resources :houses
    end
  end
end
