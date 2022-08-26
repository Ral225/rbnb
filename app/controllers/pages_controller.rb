class PagesController < ApplicationController
  def home
  end

  def my_bookings
    @bookings = RentalRequest.where(user: current_user)
    @bookings = @bookings.sort_by(&:start_date).reverse
    @message_pending = "Pending - your booking request is waiting for approval by the owner."
    @message_confirmed = "Confirmed - your booking request hast been confirmed.
    The total amount was be subtracted from your payment method."
    @message_declined = "Declined - your booking request has been declined."
  end

  def my_listings
    @parking_slots = ParkingSlot.where(user: @current_user)
  end

  def my_requests
    # @rental_requests = RentalRequest.joins(:parking_slot).where(user: current_user)
    # @rental_requests = current_user.parking_slots.where.associated(:rental_requests)
    @all_rental_requests = current_user.parking_slots.extract_associated(:rental_requests).flatten
    @pending_rental_requests = @all_rental_requests.select { |rental_request| rental_request.status = "pending" }
  end
end
