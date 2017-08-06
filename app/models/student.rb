class Student < ApplicationRecord
  # relations
  belongs_to :unit
  has_many :responsible
  has_many :teams, through: :matriculations

  validates :name, :unit_id, presence: true
end
