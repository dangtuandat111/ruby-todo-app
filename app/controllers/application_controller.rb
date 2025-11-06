class ApplicationController < ActionController::Base
  before_action :authenticate_request

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def hello
    render html: "hello, world!ss"
  end

  def authenticate_request
    token = cookies.signed[:jwt]

    if token.blank?
      header = request.headers["Authorization"]
      token = header.split(" ").last if header.present?
    end

    if token.blank?
      # render json: { error: "Missing token" }, status: :unauthorized
      return
    end

    begin
      decoded = JWT.decode(token, Rails.application.secret_key_base, true, algorithm: "HS256")
      @current_user = User.find(decoded[0]["user_id"])
      return
    rescue JWT::ExpiredSignature
      Rails.logger.warn "Token has expired"
      @current_user = nil
      # render json: { error: "Token has expired" }, status: :unauthorized
      return
    rescue JWT::DecodeError, ActiveRecord::RecordNotFound
      Rails.logger.warn "Invalid token"
      @current_user = nil
      # render json: { error: "Invalid token" }, status: :unauthorized
      return
    end
  end
end
