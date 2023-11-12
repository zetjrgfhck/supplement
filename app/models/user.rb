class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  enum gender: { man: 0, woman: 1, other: 2 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def age
    now = Time.current.beginning_of_day.to_date.strftime("%Y%m%d").to_i
    birth = self.birthday.in_time_zone.beginning_of_day.to_date.strftime("%Y%m%d").to_i
    (now - birth) / 10000
  end
  
  def era
    "#{self.age.floor(-1)}代"
  end
end
