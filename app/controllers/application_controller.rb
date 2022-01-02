class ApplicationController < ActionController::Base
    
    before_action :authorized, :set_tags
    helper_method :current_user
    helper_method :logged_in?
    
    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    def authorized
        # redirect_to '/welcome' unless logged_in?
    end

    def set_tags
        @tag_names = ["primary", "secondary", "success", "info", "warning", "danger", "light", "dark"]
    end
end
