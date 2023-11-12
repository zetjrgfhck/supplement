class Review < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :bookmarks
  has_one_attached :image
end
