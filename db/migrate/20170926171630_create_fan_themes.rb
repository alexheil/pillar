class CreateFanThemes < ActiveRecord::Migration[5.0]
  def change
    create_table :fan_themes do |t|
    	t.references :fan
    	t.string :main_color, default: ""
    	t.string :text_color, default: ""
    	t.string :background_color, default: ""
    	t.string :link_color, default: ""

      t.timestamps
    end
  end
end
