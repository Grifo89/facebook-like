Rails.application.routes.draw do
  root 'profile#index'
  get 'profile', to: 'profile#index'
  devise_for :users
  resources :posts do
      post 'like', to: 'posts#like'
  end
end
