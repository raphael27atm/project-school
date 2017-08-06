FactoryGirl.define do
  factory :teacher do
    name Faker::Name.unique.name
    unit_id { create(:unit).id }
  end
end
