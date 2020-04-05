class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true,length: { maximum: 6 }
  validates :email, presence: true, uniqueness: true
  validates :image, presence: true
  has_many :tasks ,foreign_key:true
  has_many :todos

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = password123
      user.name = "ゲスト"
    end
  end
  
  # ユーザー写真
  mount_uploader :image, ImageUploader

end
