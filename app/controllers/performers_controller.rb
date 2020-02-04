class PerformersController < ApplicationController
    skip_before_action :require_login, only: [:index, :show, :create]

    def index
        performers = Performer.all 
        render json: performers
    end  

    def create 
        # byebug
        performer = Performer.create(performer_params)

        if performer.valid? 
            payload = {user_id: performer.id, position: "performer"}
            token = encode_token(payload)
            # Render may not be legit
            render json: {performer: performer, jwt: token}
        else 
            render json: {errors: performer.errors.full_messages},status: :not_acceptable
        end 
    end 

    def show 
        performer = Performer.find(params[:id])
        render json: performer 
    end 

    def update 
        user = Performer.find(params[:id])
        user.update(performer_params)
        if user.valid? 
            payload = {user_id: user.id, position: "performer"}
            token = encode_token(payload)
            # Render may not be legit
            render json: {user: user, token: token, position: "performer"}
        else 
            render json: {errors: user.errors.full_messages},status: :not_acceptable
        end 
    end 


    def destroy
        Performer.destroy(params[:id])
        render json: {success: "Account deleted"}
    end



    private

    def performer_params
        params.require(:performer).permit(:name, :password, :email, :location, :photo, :bio, :social_media)
    end


end
