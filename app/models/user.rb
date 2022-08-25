class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :rental_requests
  has_many :parking_slots


  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :email, presence: true
  # validates :phone, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
