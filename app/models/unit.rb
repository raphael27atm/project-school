class Unit < ApplicationRecord
  include ModuleAddess
  include SelectForSchool
  # relations
  has_many :students
  has_many :teams
  has_many :teachers

  validates :name, :school_id, presence: true
end
