module Api
  module V1
    class BaseController < ActionController::API
      before_action :authenticate_request!, except: [:create]
      attr_reader :current_user

      private

      def authenticate_request!
        header = request.headers['Authorization']
        token = header.split.last if header.present?
        decoded = JsonWebToken.decode(token) if token
        @current_user = User.find_by(id: decoded['user_id']) if decoded
        render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user
      end
    end
  end
end