class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = Booking.where(id: current_user.id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, notice: "Booking deleted."
  end

  def booking_params
    params.require(:booking).permit(
      :listing_id,
      :service_provider_id,
      :dog_owner_id,
      :confirmed,
      :booking_price
    )
  end
end