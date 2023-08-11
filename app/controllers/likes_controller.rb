class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @like = Like.new(author_id: params[:user_id], post_id: params[:post_id])

    return unless @like.save

    flash[:notice] = 'Liked'
    redirect_to user_path(params[:user_id])
  end
end
