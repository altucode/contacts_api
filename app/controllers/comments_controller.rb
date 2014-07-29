class CommentsController < ApplicationController
  def index
    render json: Comment.where(commentable_id: commentable_id, commentable_type: commentable_type)
  end

  def show
    render json: Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params) do |c|
      c.commentable_type = commentable_type
      c.commentable_id = commentable_id
    end

    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if @comment.destroy
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def commentable_id
    self.params.permit(:user_id, :contact_id).first.last
  end

  def commentable_type
    self.params.has_key?('user_id') ? 'User' : 'Contact'
  end

  def comment_params
    params.require(:comment).permit(
      :commenter_id,
      :content
    )
  end

end
