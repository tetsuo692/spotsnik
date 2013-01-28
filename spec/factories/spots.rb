# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :spot do
    title Faker::Lorem.characters(10)
    location [Faker::Address.latitude,Faker::Address.longitude]
  end
end
