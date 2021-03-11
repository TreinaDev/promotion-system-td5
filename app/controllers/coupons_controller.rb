class CouponsController < ApplicationController
  def index
    @coupons = Coupon.all
  end

  def search
    @coupons = Coupon.where('code LIKE ?', "%#{params[:q]}%")
    render json: @coupons
  end

  def inactivate
    @coupon = Coupon.find(params[:id])
    @coupon.inactive!
    redirect_to @coupon.promotion
  end
end
