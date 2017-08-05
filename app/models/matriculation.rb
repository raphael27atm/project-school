class Matriculation < ApplicationRecord
  # relations
  belongs_to :student
  belongs_to :team
end
