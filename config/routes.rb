Rails.application.routes.draw do

  get '/welcome', to: 'sessions#welcome'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create', as: 'authentication'

  get '/dashboard', to:  'sessions#dashboard'

  post 'logout', to: 'sessions#logout'
end
