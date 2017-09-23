class CreateArtistGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_genres do |t|
    	t.references :artist
    	t.string :genre, default: ""
    	t.string :subgenre, default: ""
    	
      t.timestamps
    end
  end
end
