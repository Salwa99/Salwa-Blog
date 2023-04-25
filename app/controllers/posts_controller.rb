class PostsController < ApplicationController
  before_action :fetch_author

  def index
    @posts = @author.posts
  end

  def show
    @post = @author.posts.find(params[:post_id])
  end

  private

  def fetch_author
    @author = User.find(params[:user_id])
  end

end