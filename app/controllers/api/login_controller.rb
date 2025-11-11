module Api
    class LoginController < ActionController::API
        include ActionController::Cookies
        def postLogin
            @params = params.permit(:username, :password, :remmeberMe)
            # @user = User.all
            #
            # # print all users
            # @user.each do |user|
            #     puts "User: #{user.email}, Password: #{user.hash_pw}"
            # end

            user = User.find_by(email: params[:email].to_s)
            if user&.authenticate(params[:password])
                token = JsonWebToken.encode(user_id: user.id)

                if ActiveModel::Type::Boolean.new.cast(@params[:remember_me])
                  expires = 30.days.from_now
                else
                  expires = nil  # session cookie (mất khi đóng trình duyệt)
                end

                cookies.signed[:jwt] = {
                  value: token,
                  httponly: true,
                  secure: Rails.env.production?,
                  expires: expires
                }
                render json: { message: "Logged in" }
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