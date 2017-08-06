FactoryGirl.define do
  factory :student do
    name Faker::Name.unique.name
    age 10
    phone Faker::PhoneNumber.phone_number
    unit_id { create(:unit).id }
  end
end
