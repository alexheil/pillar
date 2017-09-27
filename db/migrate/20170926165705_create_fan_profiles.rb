class CreateFanProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :fan_profiles do |t|
    	t.references :fan
      t.text :biography, default: ""
      t.string :website_url, default: ""
      t.string :facebook_handle, default: ""
      t.string :facebook_url, default: ""
      t.string :twitter_handle, default: ""
      t.string :twitter_url, default: ""
      t.string :instagram_handle, default: ""
      t.string :instagram_url, default: ""
      t.string :youtube_handle, default: ""
      t.string :youtube_url, default: ""
      t.string :letlyrics_url, default: ""

      t.timestamps
    end
  end
end
