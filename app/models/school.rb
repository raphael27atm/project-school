class School < ApplicationRecord
  include ModuleAddess
  
  validates :name, presence: true
end
