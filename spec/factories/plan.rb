require 'faker'

FactoryGirl.define do
  factory :plan do
    name              { Faker::Commerce.color }
    slots             { Faker::Number.between(1, 20) }
    price             { Faker::Number.between(5, 40) * 100 }
    tickets           { (price || 500) / 500 }
    discount_coupon   { [(price || 500) / 200, 100].sort[0] }
    discount_tickets  { (price || 500) / 100 }
    description       { Faker::Lorem.paragraph }
  end
end
