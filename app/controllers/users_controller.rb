class UsersController < ApplicationController

    #create user
    def create
        user = User.new(user_params)
        if user.save
            session[:user_ud] = user.id
            redner json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end

    end

    #show user
    def show
        user = user.find_by(id: session[:user_id])
        if user
            render json: user
        else
            render json: { error: "Unauthorized user" }, status: :unauthorized
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password,  :password_confirmation, :image)
    end
end
