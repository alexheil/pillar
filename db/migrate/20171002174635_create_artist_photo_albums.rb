class CreateArtistPhotoAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_photo_albums do |t|
    	t.references :artist
    	t.string :title
    	t.string :slug

      t.timestamps
    end
  end
end
