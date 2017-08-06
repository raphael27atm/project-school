FactoryGirl.define do
  factory :team do
    sequence(:name) { |n| "Turma #{n}" }
    unit_id { create(:unit).id }
  end
end
