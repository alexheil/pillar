class CreateArtistMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_members do |t|
    	t.references :artist
    	t.string :instrument
    	t.string :name
    	t.boolean :past, default: false

      t.timestamps
    end
  end
end
