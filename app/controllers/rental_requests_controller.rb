class RentalRequestsController < ApplicationController

  def new
    @rentalrequest = RentalRequest.find(params[:id])
    @parkingslot = ParkingSlot.find(params[:parking_slot_id])
    # @rentalrequest.parkingslot = @parking_slot
    @markers = ParkingSlot.where(address: @parkingslot.address).geocoded.map do |parking| {
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
    # We need to solve that pbm
    @rentalrequest.user = current_user
    @rentalrequest.save!


    # @date = @rentalrequest.end_date - @rentalrequest.start_date + 1
    redirect_to new_parking_slot_rental_request_path(@parkingslot, id: @rentalrequest.id)
  end

private

  def rentalrequest_param
    params.require(:rental_request).permit(:start_date, :end_date)
  end
end
