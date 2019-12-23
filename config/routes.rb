Rails.application.routes.draw do
  root "tasks#index"
  resources :labels
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :tasks
  namespace :admin do
    resources :users
  end
  get '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'
end
