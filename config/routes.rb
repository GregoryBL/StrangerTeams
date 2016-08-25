Rails.application.routes.draw do

  devise_for :teachers, path: 'auth'

  get '/students/import' => 'students#import', as: :students_import
  post '/students/import' => 'students#create_multiple'
  resources :students
  patch '/students/:student_id/teachers/:id' => 'students_teachers#update', as: :student_teacher

  root to: 'welcome#index'

  get '/teachers/:id' => 'teachers#show', as: :teacher
  get '/teachers' => 'teachers#index', as: :teachers

  delete '/teachers/:id' => 'teachers#destroy', as: :destroy_teacher
end
