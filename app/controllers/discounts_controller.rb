class DiscountsController < ApplicationController
  def new
    @discount = Discount.new
  end

  def create
    @discount = Discount.new(discount_params)
    @discount.save
  end

  private

  def discount_params
    params.require(:discount).permit(:percentage, listing_attributes: [:id])
  end
end
