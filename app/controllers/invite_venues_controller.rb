class InviteVenuesController < ApplicationController
    skip_before_action :require_login

    def index
        inviteVenues = InviteVenue.all 
        render json: inviteVenues
    end  

    def create 
        inviteVenue = InviteVenue.create(inviteVenue_params)

        if inviteVenue.valid? 
            render json: inviteVenue
        else 
            render json: {errors: user.errors.full_messages}, status: :not_acceptable
        end 
    end 

    def show 
        inviteVenue = InviteVenue.find(params[:id])
        render json: inviteVenue
    end 



    private

    def inviteVenue_params
        params.require(:invite_venue).permit(:venue_id, :gig_id, :admin)
    end
end

