require 'rails_helper'

feature 'Admin generates coupons' do
  scenario 'if promotion approved' do
    promotion = Promotion.create!(name: 'Natal', description: 'Promoção de Natal',
                      code: 'NATAL10', discount_rate: 10, coupon_quantity: 100,
                      expiration_date: '22/12/2033')

    visit root_path
    click_on 'Promoções'
    click_on promotion.name
    click_on 'Gerar cupons'

    expect(current_path).to eq(promotion_path(promotion))
    expect(page).to have_content('Cupons gerados com sucesso')
    expect(page).to have_content('NATAL10-0001')
    expect(page).to have_content('NATAL10-0002')
    expect(page).to have_content('NATAL10-0100')
    expect(page).not_to have_content('NATAL10-0101')
  end

  # TODO: fazer esse teste
  xscenario 'hide button if promotion is not approved yet' do
    
  end

  # TODO: fazer esse teste
  xscenario 'hide button if coupons generated' do
  end
end