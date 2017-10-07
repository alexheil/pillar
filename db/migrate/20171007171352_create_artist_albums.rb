class CreateArtistAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_albums do |t|
    	t.references :artist
      t.string :title
      t.text :description
      t.integer :release_month
      t.integer :release_day
      t.integer :release_year
      t.integer :price
      t.string :currency
      t.string :image
      t.string :slug

      t.timestamps
    end
  end
end
