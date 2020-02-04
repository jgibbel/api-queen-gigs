class User < ApplicationRecord
    has_many :attends, dependent: :destroy
    has_many :follow_persons, dependent: :destroy
    has_many :follow_places, dependent: :destroy

    has_secure_password 

    

end
