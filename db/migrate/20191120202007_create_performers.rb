class CreatePerformers < ActiveRecord::Migration[6.0]
  def change
    create_table :performers do |t|
      t.string :name
      t.text :bio
      t.string :photo
      t.string :location
      t.json :social_media
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
