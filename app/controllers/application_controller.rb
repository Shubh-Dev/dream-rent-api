class ApplicationController < ActionController::Base
  before_action :authenticate_user
  @current_user = nil

  def authenticate_user
    @current_user = User.find_by(name: request.headers['name'])
  end
end
