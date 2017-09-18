class CreateArtistProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_profiles do |t|

      t.timestamps
    end
  end
end
