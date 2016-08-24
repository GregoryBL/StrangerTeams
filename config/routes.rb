Rails.application.routes.draw do

  devise_for :teachers, path: 'auth'

  resources :students

  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
