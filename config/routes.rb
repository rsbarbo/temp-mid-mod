Rails.application.routes.draw do

  root to: "links#index"

  resources :links, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:create]
    end
  end

  get '/signup', to: 'users#new'
  post '/users',  to:'user#create'


end
