Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#welcome'
  get '/welcome', to: 'users#welcome'

  get '/users/new', to: 'users#new'
  post '/users/create', to: 'users#create'
  
  get '/users/login', to: 'users#login'
  post '/users/login', to: 'users#authenticate', as: 'users_authentication'

  get '/users/:id', to: 'users#show'
end
