require 'faker'

FactoryGirl.define do
  factory :state do
    name      { Faker::Hacker.ingverb }
    is_final  { [true, false].sample }
  end
end
