class WallsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @walls = Wall.where('user_id != ?', @user.id)
    @messages = Message.where(wall_id: @user.wall.id)
    @message = Message.new
  end

  def show
    @user = User.find(params[:id])
    @messages = Message.where(wall_id: @user.wall.id)
    @message = Message.new
  end
end
