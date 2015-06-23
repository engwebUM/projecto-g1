require 'faker'

FactoryGirl.define do
  factory :sponsor do
    user
    plan
    state
    organization  { Faker::Company.name }
    person_name   { Faker::Name.name }
    person_role   { Faker::Name.title }
    person_email  { Faker::Internet.free_email(person_name) }
    person_phone  { Faker::Number.between(100_000_000, 999_999_999) }
    extra_pay     { Faker::Number.between(-10, 5) * 10 }
    next_step     { Faker::Hacker.say_something_smart }
    notes         { Faker::Lorem.sentence }
  end
end
