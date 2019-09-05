Rails.application.routes.draw do
  resources :assignments
  resources :materials
  resources :student_teachers
  resources :students, only: [:index, :show]
  resources :teachers, only: [:index, :show]

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
