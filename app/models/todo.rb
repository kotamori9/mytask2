class Todo < ApplicationRecord
  belongs_to :task
  belongs_to :user
  validates :todo, presence: true ,length: { maximum: 10 }
  validates :enddate, presence: true
end
