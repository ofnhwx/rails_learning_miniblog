Rails.application.routes.draw do
  root 'root#index'
  devise_for :users
  resources :users, only: %i[show]
  resources :posts, only: %i[index new create]
  resources :relationships, only: %i[create destroy]
end
