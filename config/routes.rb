Rails.application.routes.draw do
  root 'posts#index'
  get 'posts', to: 'posts#index'
  devise_for :users
  resources :posts do
      post 'like', to: 'posts#like'
  end
  resources :posts
  get 'users/index', to: 'users#index'
end
