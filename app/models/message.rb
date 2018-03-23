class Message < ApplicationRecord
  paginates_per 10

  belongs_to :user
  belongs_to :wall
  has_many :comments, as: :commentable, dependent: :destroy

  validates :body, presence: true
end
