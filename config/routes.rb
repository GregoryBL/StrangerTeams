Rails.application.routes.draw do

  devise_for :teachers, path: 'auth'

  resources :students

  root to: 'welcome#index'

  get '/teachers/:id' => 'teachers#show', as: :teacher

end
