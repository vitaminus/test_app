class Comment < ApplicationRecord
  include Commentable

  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :body, presence: true, length: { maximum: 255 }
end
