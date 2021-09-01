class SessionsController < ApplicationController

    #login method
    def create

        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { error: "Invalid username or password" }, status: :unauthorized
        end
    end

    #logout method
    def destroy
        if session[:user_id]
            session.delete :user_id
            head :no_content
        else
            render json: { error: "User not found" }, status: :unauthorized
        end
    end


end
