FactoryGirl.define do
  factory :user do
    name Faker::Name.unique.name
    email Faker::Internet.unique.email
    password 'senha'
    password_confirmation 'senha'
    association :role, factory: :role

  end
end
