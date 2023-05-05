class Api::V1::CommentsController < ApplicationController
  before_action :fetch_post

  def index
    @comments = @post.comments
    render json: @comments
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
