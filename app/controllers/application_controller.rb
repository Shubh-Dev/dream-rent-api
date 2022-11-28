class ApplicationController < ActionController::Base
    before_action :authenticate_user
    @current_user = nil

    def authenticate_user
        @current_user = User.find(request.headers['name'])
    end   
    
end
