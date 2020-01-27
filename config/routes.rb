Rails.application.routes.draw do
  root 'posts#index'
  get 'posts', to: 'posts#index'
  get 'users', to: 'users#index'
  devise_for :users
  resources :posts do
      post 'like', to: 'posts#like'
      post 'comment', to: 'posts#comment'
  end
  resources :posts

end
