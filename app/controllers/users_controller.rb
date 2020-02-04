class UsersController < ApplicationController
    skip_before_action :require_login, only: [:create, :show]

    def index
        users = User.all 
        render json: users
    end  

    def create 
        user = User.create(user_params)

        if user.valid? 
            payload = {user_id: user.id, position: "user"}
            token = encode_token(payload)
            # Render may not be legit
            render json: {user: user, jwt: token}
        else 
            render json: {errors: user.errors.full_messages},status: :not_acceptable
        end 
    end 

    def show 
        user = User.find(params[:id])
        render json: user 
    end 

    def update 
        user = User.find(params[:id])
        user.update(user_params)
        if user.valid? 
            payload = {user_id: user.id, position: "user"}
            token = encode_token(payload)
            # Render may not be legit
            render json: {user: user, token: token, position: "user"}
        else 
            render json: {errors: user.errors.full_messages},status: :not_acceptable
        end 
    end 


    def destroy
        User.destroy(params[:id])
        render json: {success: "Account deleted"}
    end



    private

    def user_params
        params.require(:user).permit(:name, :password, :email, :location)
    end

end
