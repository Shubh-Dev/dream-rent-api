class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :house_type
      t.integer :rooms
      t.boolean :balcony
      t.integer :size

      t.timestamps
    end
  end
end
