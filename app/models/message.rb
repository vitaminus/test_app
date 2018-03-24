class Message < ApplicationRecord
  include Commentable

  paginates_per 10

  belongs_to :user
  belongs_to :wall

  validates :body, presence: true
end
