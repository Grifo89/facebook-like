Rails.application.routes.draw do
  get 'posts/new'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'profile', to: 'profile#index'

  resources :posts
  root 'profile#index'

end
