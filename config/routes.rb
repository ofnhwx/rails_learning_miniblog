# frozen_string_literal: true

Rails.application.routes.draw do
  root 'root#index'
  devise_for :users
  resources :users, only: %i[show]
  resources :posts, only: %i[index show new create] do
    member do
      resources :comments, only: %i[create]
      post 'like', to: 'favorites#create'
      delete 'unlike', to: 'favorites#destroy'
      get 'favorited_by', to: 'posts#favorited_by'
    end
  end
  resources :relationships, only: %i[create destroy]
end
