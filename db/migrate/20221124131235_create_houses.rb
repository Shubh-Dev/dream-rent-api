class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :address
      t.string :house_type
      t.integer :rooms
      t.boolean :balcony, null: false
      t.integer :size

      t.timestamps
    end
  end
end
