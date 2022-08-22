class CreateParkingSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :parking_slots do |t|
      t.float :height
      t.float :width
      t.string :address
      t.float :price
      t.string :title
      t.text :description
      t.string :vehicle_type
      t.string :weather_protection
      t.string :security
      t.string :currency
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
