class RentalRequest < ApplicationRecord
  belongs_to :user
  belongs_to :parking_slot

  STATUS = ['Pending', 'Confirmed', 'Declined']
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_date, presence: true
  validates :status, presence: true, inclusion: { in: STATUS }
  # Need to migrate to set status as pending by default
  validates :total_amount, presence: true
end
