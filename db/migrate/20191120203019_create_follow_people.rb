class CreateFollowPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :follow_people do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :performer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
