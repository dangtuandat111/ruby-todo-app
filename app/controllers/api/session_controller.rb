module Api
  module V1
    class SessionsController < ActionController::API
      def create
        user = User.find_by(email: params[:email].to_s)
        if user&.authenticate(params[:password])
          token = JsonWebToken.encode(user_id: user.id)
          render json: { token: token, user: { id: user.id, email: user.email } }, status: :created
        else
          render json: { error: 'Invalid credentials' }, status: :unauthorized
        end
      end
    end
  end
end