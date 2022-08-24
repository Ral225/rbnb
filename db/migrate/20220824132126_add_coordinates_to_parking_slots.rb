class AddCoordinatesToParkingSlots < ActiveRecord::Migration[7.0]
  def change
    add_column :parking_slots, :latitude, :float
    add_column :parking_slots, :longitude, :float
  end
end
