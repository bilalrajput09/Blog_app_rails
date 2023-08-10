module Api
  module V1
    class PostsController < ApplicationController
      def index
        user = User.find(params[:user_id])
        posts = user.posts
        render json: posts
      rescue StandardError
        render json: { error: 'User not found' }, status: :bad_request
      end
    end
  end
end
