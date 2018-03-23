class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.order( created_at: :desc )
  end

  def show
    redirect_to request.referrer
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to request.referrer, notice: 'Message was successfully created.'
    else
      redirect_to request.referrer
    end
  end

  def update
    if @message.update(message_params)
      redirect_to request.referrer, notice: 'Message was successfully updated.'
    else
      redirect_to request.referrer
    end
  end

  def destroy
    @message.destroy
    redirect_to request.referrer, notice: 'Message was successfully destroyed.'
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:user_id, :wall_id, :body)
  end
end
