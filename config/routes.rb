Rails.application.routes.draw do
  root to: "posts#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :posts do
    resources :comments

    member do
      post 'liked', to: 'likes#liked'
    end
  end

  resources :users_profile, only: [:show], param: :user_id

  resources :follow_requests, only: [:create, :destroy], param: :user_id do
    member do
      patch 'accept', to: 'follow_requests#accept'
      patch 'reject', to: 'follow_requests#reject'
    end
  end

  resources :users, only: [:show], controller: 'users_profile' do
    member do
      post 'follow', to: 'follow_requests#create'
      delete 'unfollow', to: 'follow_requests#destroy'
    end
  end
end
