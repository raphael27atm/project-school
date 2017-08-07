class School < ApplicationRecord
  include ModuleAddess
  has_many :units
  has_many :users
  
  validates :name, presence: true
end
