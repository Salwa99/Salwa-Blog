class UsersController < ApplicationController
  def index
    @users = User.all
    @user_id = params[:user_id]
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
    redirect_to root_path, alert: "User not found"
  end
  end
end