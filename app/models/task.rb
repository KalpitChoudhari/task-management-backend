class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  enum status: { todo: 0, in_progress: 1, completed: 2 }
end
