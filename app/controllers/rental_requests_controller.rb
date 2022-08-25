class RentalRequestsController < ApplicationController

  def new
    @rentalrequest = RentalRequest.new
    @parkingslot = ParkingSlot.find(params[:parking_slot_id])
    @markers = @parkingslot.geocoded.map do |parking| {
      lat: parking.latitude,
      lng: parking.longitude
    }
    end

  end

  def create
    # create a new rental request parsind the start and end date from the form
    @rentalrequest = RentalRequest.new(rentalrequest_param)
    @parkingslot = ParkingSlot.find(params[:parking_slot_id])

    # add the parling slot id to rental request before saving
    @rentalrequest.parking_slot = @parkingslot
    @rentalrequest.total_amount = @parkingslot.price * ((@rentalrequest.end_date - @rentalrequest.start_date) + 1 )
    # We need to solde that pbm
    @rentalrequest.user_id = User.first.id
    @rentalrequest.save

    redirect_to new_parking_slot_rental_request_path(@parkingslot)

  end

private

def rentalrequest_param
  params.require(:rental_request).permit(:start_date, :end_date)
end


end
