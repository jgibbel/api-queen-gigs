class ChangeGigAge < ActiveRecord::Migration[6.0]
  def change
    remove_column :gigs, :age, :string
  end
end
