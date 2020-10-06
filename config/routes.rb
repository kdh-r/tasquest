Rails.application.routes.draw do
  devise_for :users
  root to: "tasks#index"
  resources :tasks
  post 'users/:id', to: 'users#level'
#   get 'tasks/:id', to: 'tasks#finish'
end