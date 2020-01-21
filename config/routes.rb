Rails.application.routes.draw do
  root 'posts#index'
  get 'posts', to: 'posts#index'
  devise_for :users
  resources :posts
  get 'users/index', to: 'users#index'
end
