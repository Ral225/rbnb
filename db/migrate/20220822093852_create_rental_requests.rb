class CreateRentalRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :rental_requests do |t|
      t.date :start_date
      t.date :end_date
      t.string :status
      t.float :total_amount
      t.references :user, null: false, foreign_key: true
      t.references :parking_slot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
