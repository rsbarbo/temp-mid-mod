Rails.application.routes.draw do

  root to: "links#index"

  get '/signup', to: 'users#new'
  post '/users',  to:'user#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :links, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:create]
    end
  end
end
