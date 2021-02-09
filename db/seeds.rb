
user = User.create!(email: 'henrique@email.com', password: '123456')
p = Promotion.create!(name: 'Natal', description: 'Promoção de Natal',
                      code: 'NATAL10', discount_rate: 10, coupon_quantity: 100,
                      expiration_date: '22/12/2033', user: user)
p.generate_coupons!