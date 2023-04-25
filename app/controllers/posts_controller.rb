class PostsController < ApplicationController
  before_action :fetch_author

  def index
    @posts = @author.posts
  end

  def show
    @post = @author.posts.find(params[:id])
  end

  private

  def fetch_author
    @user = User.find_by(id: params[:user_id])
    if @user.nil?
      redirect_to root_path, alert: "User not found"
    end
  end
end
