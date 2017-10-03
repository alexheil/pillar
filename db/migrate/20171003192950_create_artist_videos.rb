class CreateArtistVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_videos do |t|

      t.timestamps
    end
  end
end
