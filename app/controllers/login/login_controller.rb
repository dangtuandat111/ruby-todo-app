# For:  login/login#index
module Login
  class Login::LoginController < ApplicationController
    # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
    allow_browser versions: :modern

    def index

    end

    def create
      render html: "processing login"
    end
  end
end