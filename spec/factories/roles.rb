FactoryGirl.define do
  factory :role do
    name "moderator"

    trait :admin do
      name "admin"
    end

    trait :banned do
      name "banned"
    end
  end
end
