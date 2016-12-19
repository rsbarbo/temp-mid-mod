Rails.application.routes.draw do

  root to: "links#index"

  get '/signup', to: 'users#new'
  post '/users',  to:'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :links, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:create]
    end
  end
end
