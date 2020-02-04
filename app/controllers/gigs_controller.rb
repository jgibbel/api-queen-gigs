class GigsController < ApplicationController
    skip_before_action :require_login, only: [:index, :create, :show]

    def index
        gigs = Gig.all 
        render json: gigs
    end  

    def create 
        gig = Gig.create(gig_params)

        if gig.valid? 
            render json: gig
        else 
            render json: {errors: gig.errors.full_messages}, status: :not_acceptable
        end 
    end 

    def show 
        gig = Gig.find(params[:id])
        render json: gig 
    end 



    private

    def gig_params
        params.require(:gig).permit(:name, :date, :time, :poster, :description, :age, :category, :published, :latitude, :longitude, :host_id, :host_type)
    end
end
