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

    # update user
    def update
        user = User.find_by(id: session[:user_id])
        # check if old password matches
        # authenticate old password
        #take out params and update new password

    end

    # delete user
    def destroy
        #byebug
        #user = User.find_by(id: session[:user_id])
        user = User.find_by(params[:user_id])
        user.destroy
        render json: :head_content

    end

    private

    def user_params
        #if you use params.require you need to send it as a key of user from the front end / user: {}
        params.require(:user).permit(:username, :password, :password_confirmation)
        #params.permit(:username, :password, :password_confirmation)
    end
end
