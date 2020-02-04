class FollowPlace < ApplicationRecord
  belongs_to :user
  belongs_to :venue

  def venueObj
    Venue.find(venue.id)
  end

end
