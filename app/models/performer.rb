class Performer < ApplicationRecord
    has_many :gigs, as: :host
    has_many :gigs, through: :invite_performers
    
    has_many :follow_persons, dependent: :destroy
    has_many :invite_performers, dependent: :destroy

    has_secure_password 
    
end
