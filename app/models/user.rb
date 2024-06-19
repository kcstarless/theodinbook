class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  # Follow request made by the user
  has_many :active_follow_requests, class_name: 'FollowRequest', foreign_key: 'follower_id', dependent: :destroy
  has_many :following, through: :active_follow_request, source: :followed

  # Follow request to made by another user.
  has_many :passive_follow_requests, class_name: 'FollowRequest', foreign_key: 'followed_id', dependent: :destroy
  has_many :followers, through: :passive_follow_requests, source: :follwers
end
