class RentalRequest < ApplicationRecord
  belongs_to :user
  belongs_to :parking_slot

  STATUS = ['Pending', 'Approved', 'Denied']
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_date, presence: true
  validates :status, presence: true, inclusion: { in: STATUS }, default: 'Pending'
  validates :total_amount, presence: true
end
