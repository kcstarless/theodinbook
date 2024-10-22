Rails.application.routes.draw do
  resources :users, only: [:index]

  root to: "posts#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :posts do
    resources :comments

    member do
      post 'liked', to: 'likes#liked'
    end
  end

  resources :users_profile, only: [:show], param: :user_id do
    member do
      get 'edit_avatar', to: 'users_profile#edit_avatar', as: :edit_avatar
      patch 'update_avatar', to: 'users_profile#update_avatar', as: :update_avatar
    end
  end

  resources :follow_requests, only: [:create, :destroy], param: :user_id do
    member do
      patch 'accept', to: 'follow_requests#accept'
      patch 'reject', to: 'follow_requests#reject'
    end
  end

  resources :users, only: [:index, :show, :edit, :update], controller: 'users_profile' do
    member do
      post 'follow', to: 'follow_requests#create'
      delete 'unfollow', to: 'follow_requests#destroy'

    end
  end
end
