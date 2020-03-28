class Task < ApplicationRecord

  # 検索機能
  def self.search(search)
    if search
      Task.where('content LIKE(?)',"%#{search}%")
    end
  end

  belongs_to :user
  has_many :todos, dependent: :delete_all
  validates :content, presence: true

  
end
