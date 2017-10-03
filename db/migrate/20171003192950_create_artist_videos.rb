class CreateArtistVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_videos do |t|
    	t.references :artist
    	t.string :title
    	t.text :description
    	t.string :video
    	t.string :slug

      t.timestamps
    end
  end
end
