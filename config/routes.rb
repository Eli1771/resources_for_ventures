Rails.application.routes.draw do
  resources :student_teachers
  resources :students
  resources :teachers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
