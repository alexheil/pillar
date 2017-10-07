class CreateArtistTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_tracks do |t|
    	t.references :artist
      t.references :artist_album
      t.string :title
      t.integer :track_number
      t.integer :price
      t.string :currency
      t.string :audio
      t.text :lyrics
      t.string :slug

      t.timestamps
    end
  end
end
