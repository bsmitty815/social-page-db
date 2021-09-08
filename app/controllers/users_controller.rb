class UsersController < ApplicationController
    #before_action :show, :update, :destroy

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find_by(id: session[:user_id])
        render json: user
    end


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
        
        old_password = params[:oldPass][:oldPassword]
        if user&.authenticate(old_password)
            if user.update(password_params)
                render json: { message: "Password updated" }, status: 200
            else
                render json: { message:  "Passwords do not match" }, status: 422
            end
        else
            render json: { message: "Old password wrong" }, status: 422
        end


    end

    # delete user
    def destroy
        user = User.find_by(id: session[:user_id])
        user.destroy
        
        render json: :head_content

    end

    private

    def user_params
        #if you use params.require you need to send it as a key of user from the front end / user: {}
        params.require(:user).permit(:username, :password, :password_confirmation)
        #params.permit(:username, :password, :password_confirmation)
    end

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end
