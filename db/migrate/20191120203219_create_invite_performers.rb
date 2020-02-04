class CreateInvitePerformers < ActiveRecord::Migration[6.0]
  def change
    create_table :invite_performers do |t|
      t.belongs_to :performer, null: false, foreign_key: true
      t.belongs_to :gig, null: false, foreign_key: true
      t.boolean :admin

      t.timestamps
    end
  end
end
