class Address < ApplicationRecord
  geocoded_by :full_address
  after_validation :geocode

  # relations
  # polymorphic relation with schools and unit
  belongs_to :addressable, :polymorphic => true, optional: true

  #validations
  validates :number, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :neighborhood, presence: true
  validates :state, presence: true

  def full_address
    "#{street}, #{number}, #{neighborhood}, #{city}, #{state}"
  end  
end
