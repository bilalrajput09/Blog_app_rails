class PostsController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.paginate(page: params[:page], per_page: 3)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new; end

  def destroy
    post = Post.find(params[:post_id])
    post.destroy 
    flash[:notice] = "The post has been successfully deleted"
    redirect_to user_path(params[:user_id])
  end

  def create
    @post = Post.new(title: params[:title], text: params[:description], author_id: params[:user_id])
    if @post.save
      flash[:notice] = 'Your post successfully created'
      redirect_to user_path(params[:user_id])
    else
      flash.now = 'Something wrong with your input'
      render 'new'
    end
  end
end
