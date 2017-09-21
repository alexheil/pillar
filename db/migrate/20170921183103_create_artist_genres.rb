class CreateArtistGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_genres do |t|
    	t.references :artist
    	t.string :genre
    	t.string :subgenre
    	
      t.timestamps
    end
  end
end
