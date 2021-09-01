class UsersController < ApplicationController

    #create user
    def create
        user = User.create!(user_params)
        if user
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end

    end

    #show user
    def show
        
        user = User.find_by(id: session[:user_id])
        if user
            render json: user
        else
            render json: { error: "Unauthorized user" }, status: :unauthorized
        end
    end

    private

    def user_params
        #if you use params.require you need to send it as a key of user from the front end / user: {}
        params.require(:user).permit(:username, :password, :password_confirmation, :image)
        #params.permit(:username, :password, :password_confirmation, :image)
    end
end
