class Gig < ApplicationRecord
    belongs_to :host, polymorphic: true
    has_many :performers, through: :invite_performers
    has_many :venues, through: :invite_venues
    has_many :attends
    has_many :invite_performers
    has_many :invite_venues
end
