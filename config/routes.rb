Rails.application.routes.draw do
  resources :courses
  resources :assignments
  resources :materials
  resources :users

  get '/signup', to: 'users#new'
  post '/users/new', to: 'users#create'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

  get '/students/:id', to: 'students#show'
  get '/teachers/:id', to: 'teachers#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
