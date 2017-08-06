FactoryGirl.define do
  factory :responsible do
    name Faker::Name.unique.name
    student_id { create(:student).id }
  end
end
