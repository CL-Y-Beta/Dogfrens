class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]

  def home
    @listings = Listing.all.limit(4)
  end

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    @bookmark = Bookmark.new
    @listings = Listing.all.limit(6)
  end

  def my_listings
  end

  def my_listings
    @listings = current_user.listings
    # @listings = Listing.where(user_id: current_user.id)
  end

  def new
    @listing = Listing.new
  end

  def create ## Create is still not working.
    @listing = Listing.new(listing_params)
    @listing.user = current_user

    if @listing.save
      redirect_to @listing, notice: "Listing was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_to @listing, notice: "Listing was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @listing.destroy
    redirect_to my_listings_path, notice: "Listing was successfully destroyed.", status: :see_other
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    @listing = Listing.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def listing_params
    params.require(:listing).permit(:title, :description, :image_url, :location, :price, :quantity_left, :discount)
  end
end
