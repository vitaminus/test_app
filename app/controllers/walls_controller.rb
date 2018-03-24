class WallsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user ||= current_user
    @users ||= User.includes(:wall).where.not('users.id' => current_user).limit(5)
    @messages ||= Message.with_comments(@user).page params[:page]
    @message = Message.new
  end

  def show
    @user ||= User.find(params[:id])
    @messages ||= Message.with_comments(@user).page params[:page]
    @message = Message.new
  end
end
