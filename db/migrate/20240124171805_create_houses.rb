class CreateHouses < ActiveRecord::Migration[7.1]
  def change
    create_table :houses do |t|
      t.integer :price
      t.string :house_number
      t.string :house_type
      t.string :floor
      t.string :image_url_1
      t.string :image_url_2
      t.string :image_url_3
      t.string :image_url_4
      t.string :image_url_5
      t.boolean :has_kitchen
      t.boolean :has_bedroom
      t.boolean :has_bathroom
      t.boolean :has_wifi
      t.boolean :is_vacant

      t.timestamps
    end
  end
end
