Rails.application.routes.draw do

  devise_for :teachers, path: 'auth'

  get '/students/import' => 'students#import', as: :students_import
  post '/students/import' => 'students#create_multiple'
  resources :students

  patch '/students/:student_id/teachers/:id' => 'students_teachers#update', as: :student_teacher
  patch '/students/:student_id/teachers/:id/remove' => 'students_teachers#remove', as: :remove_student_teacher


  get '/teachers/:id' => 'teachers#show', as: :teacher
  get '/teachers' => 'teachers#index', as: :teachers

  delete '/teachers/:id' => 'teachers#destroy'

  root to: 'welcome#index'
end
