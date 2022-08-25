class RentalRequestsController < ApplicationController
  before_action :authenticate_user!
  def new
    @rentalrequest = RentalRequest.new
    @parkingslot = ParkingSlot.find(params[:parking_slot_id])
  end
end
