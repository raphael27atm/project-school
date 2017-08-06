class Role < ApplicationRecord
  # relations
  has_many :users
  
  validates :name, presence: true
end
