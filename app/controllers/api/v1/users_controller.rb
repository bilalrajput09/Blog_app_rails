module Api
  module V1
    class UsersController < ApplicationController
      protect_from_forgery with: :null_session
      def index
        @users = User.all
        render json: @users
      end

      def create
        user = User.new(name: request.headers[:name], email: request.headers[:email],
                        password: request.headers[:password],
                        password_confirmation: request.headers[:password_confirmation])
        if user.save
          render json: { message: 'User successfully created', api_token: user.api_token }, status: :created
        else
          render json: { errors: 'User is not created' }, status: :bad_request
        end
      end
    end
  end
end
