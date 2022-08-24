class ParkingSlotController < ApplicationController

  def index
    @parkingslots = ParkingSlots.all
  end

  def show
    @parkingslot = ParkingSlots.find(params[:id])
  end
end
