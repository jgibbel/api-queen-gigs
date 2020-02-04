class AddToGig < ActiveRecord::Migration[6.0]
  def change
    add_column :gigs, :venue_name, :string
    add_column :gigs, :venue_address, :string
  end
end
