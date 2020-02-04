class InvitePerformersController < ApplicationController
    skip_before_action :require_login

    def index
        invitePerformers = InvitePerformer.all 
        render json: invitePerformers
    end  

    def create 
        invitePerformer = InvitePerformer.create(invitePerformer_params)

        if invitePerformer.valid? 
            render json: invitePerformer
        else 
            render json: {errors: invitePerformer.errors.full_messages}, status: :not_acceptable
        end 
    end 

    def show 
        invitePerformer = InvitePerformer.find(params[:id])
        render json: invitePerformer 
    end 



    private

    def invitePerformer_params
        params.require(:invite_performer).permit(:performer_id, :gig_id, :admin)
    end
end
