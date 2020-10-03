Rails.application.routes.draw do
  devise_for :users
  root to: "tasks#index"
  resources :tasks do
    post '/tasks/:task_id/levels', to: 'levels#create'
  end
  get 'tasks/:id', to: 'tasks#finish'
end