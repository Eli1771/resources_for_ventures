Rails.application.routes.draw do
  resources :courses
  resources :assignments
  resources :materials
  resources :users
  resources :student_teachers

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
