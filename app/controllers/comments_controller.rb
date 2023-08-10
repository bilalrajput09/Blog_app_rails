class CommentsController < ApplicationController
  def create
    @comment = Comment.new(text: params[:comment], author_id: current_user.id, post_id: params[:post_id])

    flash[:notice] = if @comment.save
                       'Comment created successfully'
                     else
                       'Comment is not created'
                     end
    redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
  end

  def destroy 
    comment = Comment.find(params[:comment_id])
    comment.destroy 
    flash[:notice] = "Comment has successfully deleted"

    redirect_to user_path(params[:user_id])
  end
end
