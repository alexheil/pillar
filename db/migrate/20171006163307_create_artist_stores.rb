class CreateArtistStores < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_stores do |t|
      t.references :artist
      t.string :stripe_publishable_key
      t.string :stripe_secret_key
      t.string :stripe_id
      t.string :first_name
      t.string :last_name
      t.string :currency
      t.string :country
      t.integer :month
      t.integer :day
      t.integer :year

      t.timestamps
    end
    
    add_index :artist_stores, :stripe_publishable_key
    add_index :artist_stores, :stripe_secret_key
    add_index :artist_stores, :stripe_id
  end
end
