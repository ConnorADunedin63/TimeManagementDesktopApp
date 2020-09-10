Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/welcome', to: 'users#welcome'
  get '/users/new', to: 'users#new'
  get '/users/:id', to: 'users#show'
end
