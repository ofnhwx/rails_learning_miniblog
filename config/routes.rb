Rails.application.routes.draw do
  get 'users/show'
  root 'home#index'
  devise_for :users
  resources :users, only: %i[show]
  resources :posts, only: %i[create]
end
