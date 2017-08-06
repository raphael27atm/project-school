FactoryGirl.define do
  factory :unit do
    sequence(:name) {|n|"Unidade #{n}"}
    school_id { create(:school).id }
    # Move unit address
    [1, 2, 3, 4, 5].each do |n|
      trait :"address_#{n}_km" do
        address { build(:address, :"km_#{n}") }
      end
    end
  end
end 
