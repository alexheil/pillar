class CreateFanLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :fan_locations do |t|
    	t.references :fan
      t.string :city, default: ""
      t.string :state, default: ""
      t.string :country, default: ""

      t.timestamps
    end
  end
end
