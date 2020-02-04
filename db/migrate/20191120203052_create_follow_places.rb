class CreateFollowPlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :follow_places do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :venue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
