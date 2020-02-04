class FollowPeopleController < ApplicationController

    def index
        followPeoples = FollowPerson.all 
        render json: followPeoples
    end  

    def create 
        followPeople = FollowPerson.create(followPeople_params)

        if followPeople.valid? 
            render json: followPeople
        else 
            render json: {errors: followPeople.errors.full_messages}, status: :not_acceptable
        end 
    end 

    def show 
        followPeople = FollowPerson.find(params[:id])
        render json: followPeople 
    end 



    private

    def followPeople_params
        params.require(:follow_person).permit(:user_id, :performer_id)
    end
end
