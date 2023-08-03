class CommentsController < ApplicationController

    def create 
        @comment = Comment.new(text: params[:comment], author_id: current_user.id, post_id: params[:post_id])
        
        if @comment.save 
            flash[:notice] = "Comment created successfully"
            redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
        else
            flash[:notice] = "Comment is not created"
            redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
        end
    end
end