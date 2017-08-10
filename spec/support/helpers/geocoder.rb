Geocoder.configure(:lookup => :test)

address_data = [
  {
    latitude: -3.7430526, 
    longitude: -38.5035642,
    street: "Rua Joaquim Nabuco",
    number: 2829,
    complement: "Cobertura",
    neighborhood: 'Dionísio Torres',
    city: "Fortaleza",
    state: "CE",
  }
]

Geocoder::Lookup::Test.set_default_stub(address_data)