class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes

  def likes_count
    likes.where(value: true).count
  end

  def dislikes_count
    likes.where(value: false).count
  end
end
