FactoryGirl.define do
  factory :school do
    sequence(:name) { |n| "Escola #{n}" }

    # Move school address
    [1, 2, 3, 4, 5].each do |n|
      trait :"address_#{n}_km" do
        address { build(:address, :"km_#{n}") }
      end
    end
    
  end
end
