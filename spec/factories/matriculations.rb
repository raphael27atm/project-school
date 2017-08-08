FactoryGirl.define do
  factory :matriculation do
    number Faker::Number.number(10)
    student_id { create(:student).id }
    team_id { create(:team).id }
  end
end
