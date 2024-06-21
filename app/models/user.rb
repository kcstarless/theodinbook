class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  # Follow request made by the user
  has_many :active_follow_requests, class_name: 'FollowRequest', foreign_key: 'follower_id', dependent: :destroy
  # Select only status accepted requests therefore following
  has_many :accepted_active_follow_requests, -> { accepted }, class_name: 'FollowRequest', foreign_key: 'follower_id'
  has_many :following, through: :accepted_active_follow_requests, source: :followed

  # Follow request to made by another user.
  has_many :passive_follow_requests, class_name: 'FollowRequest', foreign_key: 'followed_id', dependent: :destroy
  # Select only status accepted requests therefore followers
  has_many :accepted_passive_follow_requests, -> { accepted }, class_name: 'FollowRequest', foreign_key: 'followed_id'
  has_many :followers, through: :accepted_passive_follow_requests, source: :follower

  # Post likes
  has_many :liked_posts, through: :posts, source: :likes
end
