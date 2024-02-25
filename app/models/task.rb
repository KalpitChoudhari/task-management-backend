class Task < ApplicationRecord
  belongs_to :user

  enum status: { todo: 0, in_progress: 1, completed: 2 }
end
