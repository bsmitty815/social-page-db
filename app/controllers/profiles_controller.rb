class ProfilesController < ApplicationController

    #update profile
    def update
        byebug
        user = User.find_by(id: session[:user_id])
        profile = user.profile
        #byebug
        if profile
            profile.update(profile_params)
            render json: user, status: 200
            #update user
        elsif !user
            render json: { errors: user.errors.full_messages }, status: :unauthorized
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def profile_params
        #params.require(:profile).permit(:image, :bio, :status)
        params.require(:profile).permit(:image, :bio, :status, :avatar)
    end
end
