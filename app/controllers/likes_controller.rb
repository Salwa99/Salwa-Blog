class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(author: current_user, post: @post)
    if @like.save
      flash[:success] = "Liked the #{@post.title}!"
    else
      flash[:error] = 'Failed to create like'
    end
    redirect_to user_post_path(@post.author, @post)
  end
end
