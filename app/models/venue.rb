class Venue < ApplicationRecord
    has_many :gigs, as: :host
    has_many :gigs, through: :invite_venues

    has_many :invite_venues, dependent: :destroy
    has_many :follow_places, dependent: :destroy

    has_secure_password 
end
