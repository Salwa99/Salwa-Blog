class Api::V1::CommentsController < ApplicationController
  before_action :fetch_post
  skip_before_action :verify_authenticity_token

  def index
    @comments = @post.comments
    render json: @comments
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    if @comment.save
      render json: @comment, status: :created
    else
      render json: { error: 'Failed to create comment' }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def fetch_post
    @post = Post.find_by(id: params[:post_id])
    head :not_found if @post.nil?
  end
end
