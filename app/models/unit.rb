class Unit < ApplicationRecord
  include ModuleAddess
  # relations
  has_many :students
  has_many :teams
  has_many :teaches

  validates :name, :school_id, presence: true
end
