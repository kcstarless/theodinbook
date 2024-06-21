class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :body, presence: true
  validates :title, presence: true

  belongs_to :user
  has_many :likes, foreign_key: 'posted', dependent: :destroy

  def likes_count
    likes.count
  end
end
