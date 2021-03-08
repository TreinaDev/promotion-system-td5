require 'rails_helper'

describe 'Coupon management' do
  context 'GET coupon' do
    it 'should render coupon information' do
      #Arrange
      user = User.create!(email: 'joao@email.com', password: '123456')
      promotion = Promotion.create!(name: 'Natal', description: 'Promoção de Natal',
                      code: 'NATAL10', discount_rate: 10, coupon_quantity: 1,
                      expiration_date: '22/12/2033', user: user)
      promotion.generate_coupons!
      coupon = promotion.coupons.last

      #Act
      get "/api/v1/coupons/#{coupon.code}"

      #Assert
      json_response = JSON.parse(response.body, symbolize_names: true)


      expect(response).to have_http_status(200)
      expect(json_response[:status]).to eq('active')
      expect(json_response[:promotion][:discount_rate]).to eq('10.0')
      expect(json_response[:code]).to eq(coupon.code)
      #expect(json_response[:expiration_date]).to eq('22/12/2033')
    end

    it 'should return 404 if coupon code does not exist' do
      
      get '/api/v1/coupons/BLABLABLA'

      expect(response).to have_http_status :not_found
    end
  end
end