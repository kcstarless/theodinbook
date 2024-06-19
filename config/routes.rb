Rails.application.routes.draw do
  devise_for :users

  resources :posts

  # get 'my_posts', to: 'posts#my_posts', as: 'my_posts'
  root to: "posts#index"

end
