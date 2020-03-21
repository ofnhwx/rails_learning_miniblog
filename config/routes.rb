Rails.application.routes.draw do
  get 'users/show'
  root 'posts#index'
  devise_for :users
  resources :users, only: %i[show]
  resources :posts, only: %i[index new create]
end
