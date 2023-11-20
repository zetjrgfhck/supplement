class Review < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :bookmarks
  has_many_attached :images
  
  def self.search(keyword)
    if keyword != ""
      Review.where('text LIKE(?)', "%#{keyword}%")
    else
      Review.all
    end
  end
end
