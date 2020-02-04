class InviteVenue < ApplicationRecord
  belongs_to :venue
  belongs_to :gig

  def venueObj
    Venue.find(venue.id)
  end

end
