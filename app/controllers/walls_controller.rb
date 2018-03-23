class WallsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @walls = Wall.where('user_id != ?', @user.id).limit(5)
    @messages = Message.where(wall_id: @user.wall.id).order(created_at: :desc).page params[:page]
    @message = Message.new
  end

  def show
    @user = User.find(params[:id])
    @messages = Message.where(wall_id: @user.wall.id).order(created_at: :desc).page params[:page]
    @message = Message.new
  end
end
