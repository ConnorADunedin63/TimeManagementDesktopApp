Rails.application.routes.draw do

  get '/welcome', to: 'sessions#welcome'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create', as: 'authentication'

  get '/authorized', to:  'sessions#page_requires_login'
end
