class LikesController < ApplicationController

    def create 

        @like = Like.new(author_id: params[:user_id], post_id: params[:post_id])

        if @like.save 
            flash[:notice] = "Liked"
            redirect_to user_path(params[:user_id])
        end
    end
end