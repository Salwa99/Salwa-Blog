class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

def create
  @comment = @post.comments.build(comment_params)
  @comment.user = current_user
  if @comment.save
    render json: @comment, status: :created
  else
    render json: { error: 'Failed to create comment' }, status: :unprocessable_entity
  end
end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back_or_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
