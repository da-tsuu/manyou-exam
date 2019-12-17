Rails.application.routes.draw do
  root "users#new"
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  # root "tasks#index"
  resources :tasks
end
