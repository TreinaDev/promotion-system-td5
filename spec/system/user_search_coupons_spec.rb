require 'rails_helper'

describe 'User search coupons' do
  it 'and find result', :js do
    promotion = create(:promotion, coupon_quantity: 2, code: 'NATAL')
    other_promotion = create(:promotion, coupon_quantity: 2, code: 'NATAL2')
    not_searchable = create(:promotion, coupon_quantity: 2, code: 'CARNA')
    promotion.generate_coupons!
    other_promotion.generate_coupons!
    not_searchable.generate_coupons!

    login_as promotion.user
    visit root_path
    click_on 'Cupons'
    fill_in 'Termo', with: 'NATA'
    click_on 'Busca'

    expect(promotion.coupons.count).to eq(2)
    expect(other_promotion.coupons.count).to eq(2)
    expect(not_searchable.coupons.count).to eq(2)
    promotion.coupons.each do |coupon|
      expect(page).to have_content(coupon.code)
    end
    other_promotion.coupons.each do |coupon|
      expect(page).to have_content(coupon.code)
    end
    not_searchable.coupons.each do |coupon|
      expect(page).not_to have_content(coupon.code)
    end
  end
end
