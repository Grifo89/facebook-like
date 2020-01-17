Rails.application.routes.draw do
  root 'profile#index'
  get 'posts/new'
  get 'profile', to: 'profile#index'
  devise_for :users
  resources :posts
end
