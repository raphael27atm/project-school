FactoryGirl.define do
  factory :user do
    name Faker::Name.unique.name
    sequence(:email) { |n| "user_email#{n}@email.com" }
    password 'senha'
    sequence(:auth_token){ |n| "token#{n}"}
    password_confirmation 'senha'
    association :role, factory: :role
    association :school, factory: :school
  end
end
