class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  # belongs_to :parent, class_name: 'Comment', optional: true
  has_many :comments, as: :commentable, dependent: :destroy

  validates :body, presence: true, length: { maximum: 255 }
end
