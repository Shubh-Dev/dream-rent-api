class API::V1::UsersController < ApplicationController
  def show 
    options = { include: [:homes, :appoiments] }
    render json: UserSerializer.new(@user, options)
  end
end