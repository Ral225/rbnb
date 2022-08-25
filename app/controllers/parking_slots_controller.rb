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
end
