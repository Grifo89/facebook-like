Rails.application.routes.draw do
  root 'posts#index'
  get 'posts', to: 'posts#index'
  get 'users', to: 'users#index'

  post 'users/friendrq/:id', to: 'users#send_friend_request', as: 'friendsrq'
  post 'users/friendrs/:id', to: 'users#send_friend_response', as: 'friendsrs'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :posts do
      post 'like', to: 'posts#like'
      post 'comment', to: 'posts#comment'
  end
end
