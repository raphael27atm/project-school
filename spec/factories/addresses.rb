FactoryGirl.define do
  factory :address do
    street "Rua Joaquim Nabuco"
    number 2829
    complement "Cobertura"
    neighborhood 'Dionísio Torres'
    city "Fortaleza"
    state "CE"
    latitude { -3.7430526 }
    longitude { -3.7430526 }
    #location [  -3.7430526, -38.5035642 ]

    [1, 2, 3, 4, 5].each do |n|
      trait :"km_#{n}" do
        city { "Dionísio Torres - #{n} km" }
        latitude { -3.7430526 }
        longitude { (-38.5035642 - (0.01 * n) ) }

        #location { [(-3.7430526 - (0.01 * n) ), -38.5035642] }
      end
    end
  end
end
