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
        # Assumes that you have already have generated token so it will come in the post request from api,
        token = request.headers('X-token')
        user = User.find_by(api_token: token)
        post = Post.find(params[:post_id])

        comment = Comment.new(
          text: request.body('text'),
          author_id: user.id,
          post_id: post.id
        )

        if comment.save
          render json: { success: 'Comment posted successfully' }, status: :created
        else
          render json: { errors: comment.errors.full_messages }, status: :bad_request
        end
      rescue StandardError => e
        render json: { error: e.messages }, status: :bad_request
      end
    end
  end
end
