class PagesController < ApplicationController
  def home
  end

  def my_bookings
    @bookings = RentalRequest.where(user: @current_user)
  end
end
