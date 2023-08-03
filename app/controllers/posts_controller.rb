class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
  end

  def create 
    @post = Post.new(title: params[:title], text: params[:description], author_id: params[:user_id])
    if @post.save
      flash[:notice] = "Your post successfully created"
      redirect_to user_path
    else
      flash.now = "Something wrong with your input"
      render "new"
    end
  end
end
