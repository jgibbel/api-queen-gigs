class CreateInviteVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :invite_venues do |t|
      t.belongs_to :venue, null: false, foreign_key: true
      t.belongs_to :gig, null: false, foreign_key: true
      t.boolean :admin

      t.timestamps
    end
  end
end
