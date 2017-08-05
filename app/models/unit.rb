class Unit < ApplicationRecord
  # relations
  belongs_to :address
  has_many :students
  has_many :teams
  has_many :teaches
end
