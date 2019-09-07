Rails.application.routes.draw do
  root 'users#home'

  resources :courses, only: [:show] do
    resources :materials, only: [:index, :show, :new, :create]
  end

  resources :assignments, only: [:index, :show, :new, :create]
  resources :materials, only: [:index, :show]
  resources :users, only: [:index, :show, :new, :create]

  get '/signup', to: 'users#new'
  post '/users/new', to: 'users#create'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#fb_create'

  get '/students', to: 'students#index'
  get '/teachers', to: 'teachers#index'
  scope :teachers do
    resources :materials, only: [:new, :create, :edit, :update]
    resources :assignments, only: [:new, :create]
  end
  get '/students/:id', to: 'students#show'
  get '/teachers/:id', to: 'teachers#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
