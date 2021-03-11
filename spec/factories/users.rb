FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "joao#{i}@email.com" }
    password  { "123456789" }
  end
end
