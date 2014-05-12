Rails.application.routes.draw do
  resources :tasks, only: [:index]
  root 'tasks#index'
end
