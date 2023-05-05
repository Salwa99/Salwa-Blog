class Api::V1::PostsController < ApplicationController
  before_action :fetch_author
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
    render json: @posts
  end

  def show
    @post = @user.posts.find(params[:id])
    render json: @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def fetch_author
    @user = User.find_by(id: params[:user_id])
    head :not_found if @user.nil?
  end
end
