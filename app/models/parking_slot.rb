class ParkingSlot < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :rental_requests, dependent: :destroy

  SECURITY = ["Camera", "Insurance","Alarm"]
  # validates :height, presence: true
  validates :width, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :vehicle_type, presence: true
  validates :weather_protection, presence: true
  validates :security, presence: true, inclusion: { in: SECURITY }
  validates :currency, presence: true

  # include PgSearch::Model
  # pg_search_scope :search_by_address,
  #   against: [ :address ],
  #   using: {
  #     tsearch: { prefix: true }
  #   }
end
