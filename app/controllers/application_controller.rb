class ApplicationController < ActionController::API
    before_action :require_login

    private

    def encode_token(payload)
        JWT.encode(payload, signing_secret)
    end 

    def auth_header
        request.headers['Authorization'].split(' ')[1]
    end 

    def decoded_token(token)
        if auth_header 
            token = auth_header
            begin
                JWT.decode(token, signing_secret, true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end 
        end 
    end 

    def session_user
        decoded_hash = decoded_token(auth_header)
        if !decoded_hash.empty?
            # Rei's use: 
            user_id = decoded_hash[0]['user_id']
            if decoded_hash[0]['position'] === "user"
                @user = User.find_by(id: user_id)
            elsif decoded_hash[0]['position'] === "performer"
                @user = Performer.find_by(id: user_id)
            elsif decoded_hash[0]['position'] === "venue"
                @user = Venue.find_by(id: user_id)
            else
                nil
            end
        end
    end

    def logged_in?
        !!session_user
    end

    # Is this going to be necessary?
    def require_login
     render json: {message: 'Please Login'}, status: :unauthorized unless logged_in?
    end

    def signing_secret
        ENV["JWT_SECRET_KEY"]
    end

end
