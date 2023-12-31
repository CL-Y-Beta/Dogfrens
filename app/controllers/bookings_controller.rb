class BookingsController < ApplicationController
  before_action :authenticate_user!

  def seller_index
    @bookings = Booking.where(service_provider_id: current_user.id)
  end

  def buyer_index
    @bookings = Booking.where(dog_owner_id: current_user.id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def accept
    @booking = Booking.find(params[:id])
    if @booking.confirmed == false || @booking.confirmed.nil?
      @booking.update(confirmed: true)
    elsif @booking.confirmed == true
      @booking.update(redeemed: true)
    end
    redirect_to seller_bookings_path
  end

  # def new
  #   @booking = Booking.new
  # end

  def create
    @listing = Listing.find(params[:listing_id])
    listing_id = params[:listing_id] || session[:current_listing_id]
    user_id = current_user.id

    booking_params = { listing_id: @listing.id,
                       service_provider_id: @listing.user_id,
                       dog_owner_id: current_user.id,
                       confirmed: false,
                       booking_price: @listing.price }
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def destroy
  #   @booking = Booking.find(params[:id])
  #   @booking.destroy
  #   redirect_to bookings_path, notice: "Booking deleted."
  # end

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
