class InvitePerformerSerializer < ActiveModel::Serializer
    attributes :id, :performer_id, :gig_id, :admin, :performerObj

  end
