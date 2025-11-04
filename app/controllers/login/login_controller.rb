# For:  login/login#index
module Login
  class LoginController < ApplicationController
    skip_before_action :authenticate_request

    # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
    allow_browser versions: :modern

    def index
      authenticate_request

      if (@current_user)
        render template: "/main" and return
      else
        render "login/index" and return
      end
    end

    def authenticate_request
      super
    end

    def create
      @params = params.permit(:username, :password)
    end

    def sample_list
      render "login/sample_list"
    end
  end
end