class CouponsController < ApplicationController
  def inactivate
    @coupon = Coupon.find(params[:id])
    raise Error if @coupon
    @coupon.inactive!
    redirect_to @coupon.promotion
  end
end