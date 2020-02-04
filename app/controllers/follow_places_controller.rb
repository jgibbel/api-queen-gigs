class FollowPlacesController < ApplicationController

    def index
        followPlaces = FollowPlace.all 
        render json: followPlaces
    end  

    def create 
        followPlace = FollowPlace.create(followPlace_params)

        if followPlace.valid? 
            render json: followPlace
        else 
            render json: {errors: followPlace.errors.full_messages}, status: :not_acceptable
        end 
    end 

    def show 
        followPlace = FollowPlace.find(params[:id])
        render json: followPlace 
    end 



    private

    def followPlace_params
        params.require(:follow_place).permit(:user_id, :venue_id)
    end
end
