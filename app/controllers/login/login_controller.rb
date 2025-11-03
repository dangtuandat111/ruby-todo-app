# For:  login/login#index
module Login
  class LoginController < ApplicationController
    skip_before_action :authenticate_request!

    # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
    allow_browser versions: :modern

    def index
      @greeting = "Welcome to the Login Page"
      @users = User.all

      # Default: looks for app/views/login/login/index.html.erb
      render "login/index"
    end

    def create
      @params = params.permit(:username, :password)
    end

    def sample_list
      render "login/sample_list"
    end
  end
end