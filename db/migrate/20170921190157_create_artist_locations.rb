class CreateArtistLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_locations do |t|
    	t.references :artist
    	t.string :city
    	t.string :state
    	t.string :country

      t.timestamps
    end
  end
end
