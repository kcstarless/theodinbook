class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :body, presence: true
  validates :title, presence: true

  belongs_to :user

  has_many :likes, foreign_key: 'posted', dependent: :destroy

  has_many :comments, foreign_key: 'post_id', dependent: :destroy

  def likes_count
    likes.count
  end
end
