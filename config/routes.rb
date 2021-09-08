Rails.application.routes.draw do
  resources :profiles, only: [:update, :index]
  resources :users, only: [:show, :update, :destroy]

  # handle login and logout
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # handle signup
  post '/signup', to: 'users#create'
  # auto login
  get '/me', to: 'users#show'
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
