class Student < ApplicationRecord
  # relations
  belongs_to :unit
  has_many :responsible
  has_many :teams, through: :matriculations
end
