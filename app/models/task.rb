class Task < ApplicationRecord
  belongs_to :user
  has_many :todos, dependent: :delete_all
  validates :content, presence: true

  # 検索機能
  def self.search(search)
    return Task.all unless search
    Task.where('content LIKE(?)',"%#{search}%")
  end

end
