class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_commentable
  before_action :set_comment, only: [ :reply, :edit, :update, :destroy ]

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to request.referrer, notice: "Comment was successfully created."
    else
      redirect_to request.referrer
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to request.referrer, notice: "Comment was successfully updated."
    else
      redirect_to request.referrer
    end
  end

  def destroy
    @comment.destroy if @comment.errors.empty?
    redirect_to request.referrer, notice: "Comments was successfully destroyed."
  end

  private

  # def set_commentable
  #   resource, id = request.path.split('/')[1,2]
  #   @commentable = resource.singularize.classify.constantize.find(id)
  # end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Message.find_by_id(params[:message_id]) if params[:message_id]
  end

  def comment_params
    params.require(:comment).permit(:body, :parent_id)
  end
end
