class ParkingSlotsController < ApplicationController

  def index
    @parkingslots = ParkingSlot.all
      # The `geocoded` scope filters only flats with coordinates
      @markers = ParkingSlot.geocoded.map do |parking| {
        lat: parking.latitude,
        lng: parking.longitude
      }
      end
  end

  def show
    @rentalrequest = RentalRequest.new
    @parkingslot = ParkingSlot.find(params[:id])
    @markers = ParkingSlot.where(address: @parkingslot.address).geocoded.map do |parking| {
      lat: parking.latitude,
      lng: parking.longitude
    }
  end
  end

  def new
    @parkingslot=ParkingSlot.new
  end

  def create
    @user = current_user
    @parkingslot = ParkingSlot.new(parkingslot_params)
    @parkingslot.user = @user
    if @parkingslot.save
      redirect_to parking_slots_path
    else
      render :new
    end
  end

  private

  def parkingslot_params
    params.require(:parking_slot).permit(:title, :description, :vehicle_type, :height, :width, :address, :price, :security, :currency, :weather_protection)
  end

end
