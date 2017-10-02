class CreateArtistPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_photos do |t|

      t.timestamps
    end
  end
end
