class CreateArtistTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_tracks do |t|

      t.timestamps
    end
  end
end
