Rails.application.routes.draw do

  devise_for :teachers, path: 'auth'

  root to: 'welcome#index'

  get '/teachers/:id' => 'teachers#show', as: :teacher

end
