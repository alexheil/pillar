class CreateArtistProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_profiles do |t|
        t.references :artist
        t.text :biography, default: ""
        t.integer :year_founded, default: ""
        t.string :email, default: ""
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
        t.string :record_label, default: ""
        t.string :influences, default: ""
        t.string :general_manager_name, default: ""
        t.string :general_manager_email, default: ""
        t.string :press_contact_name, default: ""
        t.string :press_contact_email, default: ""
        t.string :booking_agent_name, default: ""
        t.string :booking_agent_email, default: ""

      t.timestamps
    end
  end
end
