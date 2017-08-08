class Team < ApplicationRecord
  include SelectForSchool
  # relations
  belongs_to :unit
  has_many :matriculations
  has_many :students, through: :matriculations

  validates :name, :unit_id, presence: true
end
