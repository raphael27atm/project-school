class Address < ApplicationRecord
  geocoded_by :full_address
  after_validation :geocode

  # relations
  belongs_to :addressable, :polymorphic => true

  def full_address
    "#{street}, #{number}, #{neighborhood}, #{city}, #{state}"
  end  
end
