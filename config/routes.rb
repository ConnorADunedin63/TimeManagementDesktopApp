Rails.application.routes.draw do
  get '/welcome', to: 'sessions#welcome'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create', as: 'authentication'

  get '/dashboard', to:  'sessions#dashboard'

  get 'logout', to: 'sessions#logout'

  get '/goals', to: 'goals#index'

  get 'goals/new', to: 'goals#new', as: 'new_goal'

  post 'goals/create', to: 'goals#create', as: 'create_goal'

  get 'goals/show/:id', to: 'goals#show', as: 'view_goal'

  get 'goals/edit/:id', to: 'goals#edit', as: 'edit_goal'

  post 'goals/update/:id', to: 'goals#update', as: 'update_goal'

  post 'goals/destroy/:id', to: 'goals#destroy', as: 'destroy_goal'
end
