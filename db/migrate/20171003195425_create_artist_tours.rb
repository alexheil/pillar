class CreateArtistTours < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_tours do |t|
    	t.references :artist
    	t.string :title
    	t.text :description
    	t.integer :amount_of_shows
    	t.string :artists
    	t.string :image
    	t.string :slug

      t.timestamps
    end
  end
end
