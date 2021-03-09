FactoryBot.define do
  factory :promotion do
    name { "Natal" }
    description  { "Promoção de Natal" }
    code { "NATAL10"}
    discount_rate { 10 }
    coupon_quantity { 100 }
    expiration_date { 5.days.from_now }
    user

    trait :expired do 
      expiration_date { 5.days.ago }
    end
  end
end