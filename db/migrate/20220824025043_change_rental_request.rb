class ChangeRentalRequest < ActiveRecord::Migration[7.0]
  def change
    change_column :rental_requests, :status, :string, default: "Pending"
  end
end
