Rails.application.routes.draw do

  devise_for :teachers, path: 'auth'

  resources :students

  root to: 'welcome#index'

  get '/teachers/:id' => 'teachers#show', as: :teacher
  get '/teachers' => 'teachers#index', as: :teachers

  delete '/teachers/:id' => 'teachers#destroy', as: :destroy_teacher

end
