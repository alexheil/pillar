class CreateArtistTours < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_tours do |t|
    	t.references :artist

      t.timestamps
    end
  end
end
