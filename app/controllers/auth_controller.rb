class AuthController < ApplicationController
    skip_before_action :require_login, only: [:login, :auto_login, :signup]

    def login
        # byebug
        if params[:position] == "user"
            user = User.find_by(email: params[:email])
            if user && user.authenticate(params[:password])
                payload = {user_id: user.id, position: "user"}
                token = encode_token(payload)

                render json: {user: user, position: "user", token: token, success: "Welcome back, #{user.name}"}
            else
                render json: {errors: user.errors.full_messages},status: :not_acceptable
            end

        elsif params[:position] == "performer"
            user = Performer.find_by(email: params[:email])
            if user && user.authenticate(params[:password])
                payload = {user_id: user.id, position: "performer"}
                token = encode_token(payload)
           
                render json: {user: user, position: "performer", token: token, success: "Welcome back, #{user.name}"}
            else
                render json: {errors: user.errors.full_messages},status: :not_acceptable
            end

        elsif params[:position] == "venue"
            user = Venue.find_by(email: params[:email])
            if user && user.authenticate(params[:password])
                payload = {user_id: user.id, position: "venue"}
                token = encode_token(payload)
           
                render json: {user: user, position: "venue", token: token, success: "Welcome back, #{user.name}"}
            else
                render json: {errors: user.errors.full_messages},status: :not_acceptable
            end

        end

    end 

    def auto_login
        if session_user
            render json: session_user
        else
            render json: {errors: "Don't touch my cookies!"}
        end

    end

    def signup

        if params[:position] == "user"
            user = User.create(user_params)
            if user.valid?
                payload = {user_id: user.id, position: "user"}
                token = encode_token(payload)

                render json: {user: user, position: "user", token: token, success: "Welcome back, #{user.name}"}
            else
                render json: {errors: user.errors.full_messages},status: :not_acceptable
            end

        elsif params[:position] == "performer"
            user = Performer.create(performer_params)
            if user.valid?
                payload = {user_id: user.id, position: "performer"}
                token = encode_token(payload)

                render json: {user: user, position: "performer", token: token, success: "Welcome back, #{user.name}"}
            else
                render json: {errors: user.errors.full_messages},status: :not_acceptable
            end

        elsif params[:position] == "venue"
            user = Venue.create(venue_params)
            if user.valid?
                payload = {user_id: user.id, position: "venue"}
                token = encode_token(payload)

                render json: {user: user, position: "venue", token: token, success: "Welcome back, #{user.name}"}
            else
                render json: {errors: user.errors.full_messages},status: :not_acceptable
            end

        end
    end 

    private 

    def user_params
        params.require(:auth).permit(:name, :password, :email, :password_confirmation)
    end

    def performer_params
        params.require(:auth).permit(:name, :password, :email, :password_confirmation, :bio, :photo, :location, :social_media)
    end

    def venue_params
        params.require(:auth).permit(:name, :password, :email, :password_confirmation, :bio, :photo, :address, :social_media, :latitude, :longitude)
    end


end 