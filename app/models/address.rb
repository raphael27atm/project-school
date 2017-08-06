class Address < ApplicationRecord
  geocoded_by :full_address
  after_validation :geocode

  # relations
  # polymorphic relation with schools and unit
  belongs_to :addressable, :polymorphic => true, optional: true

  def full_address
    "#{street}, #{number}, #{neighborhood}, #{city}, #{state}"
  end  
end
