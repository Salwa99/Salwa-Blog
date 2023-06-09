class UsersController < ApplicationController
  def index
    @users = User.all
    @current_user = current_user
  end

  def show
    @user = User.find_by(id: params[:id])
    @current_user = current_user
    redirect_to root_path, alert: 'User not found' if @user.nil?
  end
end
