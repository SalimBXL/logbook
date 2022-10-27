class AuthenticationController < ApplicationController
    skip_before_action :authenticate, only: [:login]

    def login
        @user = User.find_by(email: params[:email])
        if @user
            if(@user.authenticate(params[:password]))
                payload = { user_id: @user.id }
                secret = ENV['SECRET_KEY_BASE'] || Rails.application.secrets.secret_key_base
                token = create_token(payload)
                time = Time.now + 24.hours.to_i
                render json: { 
                    token: token,
                    email: @user.email,
                    exp: time.strftime("%Y-%m-%d %H:%M")
                }, status: :ok
            else
                render json: { message: "Authentification Failed" }, status: :unauthorized
            end
        else
            render json: { message: "Could not find user" }, status: :unauthorized
        end
    end
end
