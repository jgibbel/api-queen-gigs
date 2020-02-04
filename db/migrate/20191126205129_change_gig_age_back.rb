class ChangeGigAgeBack < ActiveRecord::Migration[6.0]
  def change
    add_column :gigs, :age, :boolean
  end
end
