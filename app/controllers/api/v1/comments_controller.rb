module Api
  module V1
    class CommentsController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:create], if: -> { request.format.json? }

      def index
        post = Post.find(params[:post_id])
        comments = post.comments
        render json: comments
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'post not found' }, status: :not_found
      end

      def create
        # Assumes that you have already have generated
        # api_token which should come when you create user using api-endpoint,
        token = request.headers[:api_token]
        user = User.find_by(api_token: token)
        puts user
        post = Post.find(params[:post_id])
        comment = Comment.new(
          text: params[:text],
          author_id: params[:user_id],
          post_id: post.id
        )

        if comment.save
          render json: { success: 'Comment posted successfully' }, status: :created
        else
          render json: { errors: comment.errors.full_messages }, status: :bad_request
        end
      rescue StandardError => e
        render json: { errors: e.message }, status: :bad_request
      end
    end
  end
end
