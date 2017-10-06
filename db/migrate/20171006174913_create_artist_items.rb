class CreateArtistItems < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_items do |t|
			t.references :artist
      t.string :title
      t.text :description
      t.string :category
      t.integer :base_price
      t.integer :shipping_price
      t.integer :total_price
      t.string :currency
      t.integer :quantity
      t.string :options
      t.string :image
      t.string :image_two
      t.string :image_three
      t.string :slug

      t.timestamps
    end
  end
end
