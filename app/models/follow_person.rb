class FollowPerson < ApplicationRecord
  belongs_to :user
  belongs_to :performer

  def performerObj
    Performer.find(performer.id)
  end
  
end
