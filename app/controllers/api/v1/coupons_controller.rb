module Api
  module V1
    class CouponsController < ApiController
      def show
        coupon = Coupon.find_by(code: params[:id])
        return render status: 404, json: "{ msg: 'coupon not found' }" if coupon.nil?
        render json: coupon.as_json(only: [:code, :status],
                                    include: { 
                                              promotion: { only: :discount_rate }
                                      }), status: 200
      end
    end
  end
end