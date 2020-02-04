class CreateGigs < ActiveRecord::Migration[6.0]
  def change
    create_table :gigs do |t|
      t.string :name
      t.date :date
      t.string :time
      t.string :poster
      t.text :description
      t.string :age
      t.string :category
      t.boolean :published
      t.float :latitude
      t.float :longitude
      t.integer :host_id
      t.string :host_type

      t.timestamps
    end
  end
end
