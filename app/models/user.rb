class User < ApplicationRecord
  has_many :reviews
  has_many :comments
  has_many :bookmarks
  enum gender: { man: 0, woman: 1, other: 2 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
