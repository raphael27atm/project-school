class Team < ApplicationRecord
  # relations
  belongs_to :unit
  has_many :students, through: :matriculations
end
