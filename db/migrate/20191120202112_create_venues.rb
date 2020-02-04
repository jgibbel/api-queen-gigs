class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.text :bio
      t.string :photo
      t.json :social_media
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
