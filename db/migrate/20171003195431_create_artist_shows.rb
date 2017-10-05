class CreateArtistShows < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_shows do |t|
    	t.references :artist
    	t.references :artist_tour
    	t.string :title
    	t.integer :month
      t.integer :day
      t.integer :year
      t.string :venue
      t.string :location
      t.text :description
      t.string :ticket_url
      t.string :image
      t.boolean :is_independent?
      t.string :slug

      t.timestamps
    end
  end
end
