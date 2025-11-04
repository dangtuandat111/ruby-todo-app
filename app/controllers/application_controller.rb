class ApplicationController < ActionController::Base
  before_action :authenticate_request

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def hello
    render html: "hello, world!ss"
  end

  def authenticate_request
    # Ưu tiên lấy từ cookie
    token = cookies.signed[:jwt]

    # Nếu không có trong cookie thì thử lấy từ header
    if token.blank?
      header = request.headers["Authorization"]
      token = header.split(" ").last if header.present?
    end

    # Nếu vẫn không có token thì reject luôn
    if token.blank?
      render json: { error: "Missing token" }, status: :unauthorized and return
    end

    begin
      decoded = JWT.decode(token, Rails.application.secret_key_base, true, algorithm: "HS256")
      @current_user = User.find(decoded[0]["user_id"])
    rescue JWT::ExpiredSignature
      render json: { error: "Token has expired" }, status: :unauthorized and return
    rescue JWT::DecodeError, ActiveRecord::RecordNotFound
      render json: { error: "Invalid token" }, status: :unauthorized and return
    end
  end

end
