class VenuesController < ApplicationController

    skip_before_action :require_login, only: [:index, :show, :create]

    def index
        venues = Venue.all 
        render json: venues
    end  

    def create 
        venue = Venue.create(venue_params)

        if venue.valid? 
            payload = {user_id: venue.id, position: "venue"}
            token = encode_token(payload)
            # Render may not be legit
            render json: {venue: venue, jwt: token}
        else 
            render json: {errors: venue.errors.full_messages},status: :not_acceptable
        end 
    end 

    def show 
        venue = Venue.find(params[:id])
        render json: venue 
    end 

    def update 
        user = Venue.find(params[:id])
        user.update(venue_params)
        if user.valid? 
            payload = {user_id: user.id, position: "venue"}
            token = encode_token(payload)
            # Render may not be legit
            render json: {user: user, token: token, position: "venue"}
        else 
            render json: {errors: user.errors.full_messages},status: :not_acceptable
        end 
    end 


    def destroy
        Venue.destroy(params[:id])
        render json: {success: "Account deleted"}
    end



    private

    def venue_params
        params.require(:venue).permit(:name, :address, :latitude, :longitude, :password, :email, :photo, :bio, :social_media)
    end


end
