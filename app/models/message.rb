class Message < ApplicationRecord
  belongs_to :user
  belongs_to :wall

  validates :body, presence: true
end
