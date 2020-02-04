class InvitePerformer < ApplicationRecord
  belongs_to :performer
  belongs_to :gig

  def performerObj
    Performer.find(performer.id)
  end

end
