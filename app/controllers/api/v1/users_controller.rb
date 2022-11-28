class Api::V1::UsersController < ApplicationController

    def register
        @user = User.new(user_params)
        if @user.save
            render json: {status: 'SUCCESS', message: 'User created', data: @user}, status: :ok
        else
            render json: {status: 'ERROR', message: 'User not created', data: @user.errors}, status: :unprocessable_entity
        end
    end

    def user_params
        params.require(:user).permit(:name)
    end
end