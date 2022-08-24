class ParkingSlotsController < ApplicationController

  def index
    @parkingslots = ParkingSlot.all
  end

  def show
    @parkingslot = ParkingSlot.find(params[:id])
  end

  def new
    @parkingslot=ParkingSlot.new
  end
end
