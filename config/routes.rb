Rails.application.routes.draw do

  root to: "links#index"

  get '/signup', to: 'users#new'
  post '/users',  to:'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/visitor_login', to: 'sessions#index'

  resources :links, only: [:index, :create, :edit, :update]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:create]
    end
  end
end
