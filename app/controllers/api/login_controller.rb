module Api
    class LoginController < ActionController::API
        def postLogin
            @params = params.permit(:username, :password)
            # @user = User.all
            #
            # # print all users
            # @user.each do |user|
            #     puts "User: #{user.email}, Password: #{user.hash_pw}"
            # end

            user = User.find_by(email: params[:email].to_s)
            if user&.authenticate(params[:password])
              token = JsonWebToken.encode(user_id: user.id)
              render json: { token: token, user: { id: user.id, email: user.email } }, status: :created
            else
              render json: { error: 'Invalid credentials' }, status: :unauthorized
            end
        end

        def destroy
            # Logic for logging out the user (e.g., invalidating the token)
            render json: { message: 'Logged out successfully' }, status: :ok
        end
    end
end