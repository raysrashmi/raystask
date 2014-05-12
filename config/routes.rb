Rails.application.routes.draw do
  resources :tasks, only: [:index, :create, :destroy, :update]
  root 'tasks#index'

  get '*tasks' => 'tasks#index'
end
