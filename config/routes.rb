Rails.application.routes.draw do
  root 'posts#index'
  get 'posts', to: 'posts#index'
  get 'users/index', to: 'users#index'
  post 'users/friendrq/:id', to: 'users#send_friend_request', as: 'friendsrq'
  devise_for :users
  resources :posts do
      post 'like', to: 'posts#like'
      post 'comment', to: 'posts#comment'
  end
end
