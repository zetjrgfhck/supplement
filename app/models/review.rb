class Review < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :bookmarks
  has_many_attached :images

  validates :title, presence: true
  validates :content, presence: true
  
  def favorited_by?(user)
    bookmarks.exists?(user_id: user.id)
  end
end
