class Like < ApplicationRecord
  belongs_to :post, foreign_key: 'posted'
  belongs_to :user, foreign_key: 'liked'
end
