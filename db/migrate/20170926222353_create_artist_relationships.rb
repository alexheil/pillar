class CreateArtistRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_relationships do |t|
    	t.references :artist
    	t.references :fan
    	t.boolean :post_email, default: true
    	t.boolean :photo_email, default: true
    	t.boolean :video_email, default: true
    	t.boolean :merch_email, default: true
    	t.boolean :tour_email, default: true
    	t.boolean :show_email, default: true
    	t.boolean :album_email, default: true

      t.timestamps
    end
  end
end
