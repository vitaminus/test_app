class Message < ApplicationRecord
  include Commentable

  paginates_per 10

  belongs_to :user
  belongs_to :wall

  validates :body, presence: true

  scope :with_comments, -> (user) { where(wall_id: user.wall.id).includes(comments: :comments).order(created_at: :desc) }
end
