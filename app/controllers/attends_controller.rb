class AttendsController < ApplicationController

    def index
        attends = Attend.all 
        render json: attends
    end  

    def create 
        attend = Attend.create(attend_params)

        if attend.valid? 
            render json: attend
        else 
            render json: {errors: attend.errors.full_messages}, status: :not_acceptable
        end 
    end 

    def show 
        attend = Attend.find(params[:id])
        render json: attend 
    end 



    private

    def attend_params
        params.require(:attend).permit(:user_id, :gig_id)
    end
end
