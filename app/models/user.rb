class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github, :google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.nickname || auth.info.name
      user.avatar_url = auth.info.image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end


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
  has_many :likes, foreign_key: 'liked'
  has_many :liked_posts, through: :posts, source: :likes

  # User comments
  has_many :comments, foreign_key: 'user_id'

  # Active storage for avatar
  has_one_attached :avatar

  # Check if post was liked
  def liked_post?(post)
    likes.exists?(posted: post.id)
  end

  # Returns total likes on users post
  def total_likes(user)
    posts.joins(:likes).count
  end
end
