Rails.application.routes.draw do

  get 'goals/index'

  get 'goals/new'

  get 'goals/show'

  get 'goals/edit'

  get 'goals/destroy'

  get '/welcome', to: 'sessions#welcome'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create', as: 'authentication'

  get '/dashboard', to:  'sessions#dashboard'

  post 'logout', to: 'sessions#logout'
end
