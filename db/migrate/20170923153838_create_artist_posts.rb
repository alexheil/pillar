class CreateArtistPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_posts do |t|
    	t.references :artist
    	t.text :content
    	t.string :link, default: ""
    	t.string :image, default: ""

      t.timestamps
    end
  end
end
