class UsersController < ApplicationController
  protect_from_forgery with: :exception
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
