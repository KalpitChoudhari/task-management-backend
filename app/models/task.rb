class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: %w(todo in_progress completed) }

  enum status: { todo: 0, in_progress: 1, completed: 2 }
end
