class ProfilesController < ApplicationController

    #update profile
    def update
        user = User.find_by(id: session[:id])
        if user
            user.update(profile_params)
            render json: user, status: 200
            #update user
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def profile_params
        params.require(:user).permit(:image, :bio, :status)
    end
end
