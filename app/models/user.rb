class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :wall, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_create :set_wall

  def set_wall
    Wall.create(user_id: self.id)
  end
end
