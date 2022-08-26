class PagesController < ApplicationController
  def home
  end

  def my_bookings
    @bookings = RentalRequest.where(user: @current_user)
  end

  def my_listings
    @parking_slots = ParkingSlot.where(user: @current_user)
  end
end
