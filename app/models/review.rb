class Review < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :bookmarks
  has_many_attached :images

  def favorited_by?(user)
    bookmarks.exists?(user_id: user.id)
  end
end
