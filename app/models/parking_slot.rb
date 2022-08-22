class ParkingSlot < ApplicationRecord
  belongs_to :user
  has_many :rental_requests, dependent: :destroy

  # SECURITY = ["Camera", "Insurance","Alarm",  ]
  # validates :height, presence: true
  validates :width, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :vehicule_type, presence: true
  validates :weather_protection, presence: true
  validates :security, presence: true
  validates :currency, presence: true
end
