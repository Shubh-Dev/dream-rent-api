class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user
  def index
    @users = User.all.order(:id)
    render json: @users
  end

  def register
    if User.find_by(user_params).nil?
      @user = User.new(user_params)
      if @user.save
        render json: { status: 'SUCCESS', message: 'User created', data: @user }, status: :ok
      else
        render json: { status: 'ERROR', message: 'User not created', data: @user.errors },
               status: :unprocessable_entity
      end
    else
      render json: { status: 'ERROR', message: 'User already exists' }, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(user_params)
    if @user.nil?
      render json: { status: 'ERROR', message: 'User not found' }, status: :unprocessable_entity
    else
      render json: { status: 'SUCCESS', message: 'User logged in', data: @user }, status: :ok
    end
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
