class CreateArtistLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_locations do |t|
    	t.references :artist
    	t.string :city, default: ""
    	t.string :state, default: ""
    	t.string :country, default: ""

      t.timestamps
    end
  end
end
