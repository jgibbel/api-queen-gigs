class InviteVenueSerializer < ActiveModel::Serializer
    attributes :id, :venue_id, :gig_id, :admin, :venueObj

  end
