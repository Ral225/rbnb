class RentalRequestsController < ApplicationController
  def new
    @rentalrequest = RentalRequest.new
    @parkingslot = ParkingSlot.find(params[:parking_slot_id])
  end
end
