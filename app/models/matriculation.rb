class Matriculation < ApplicationRecord
  # relations
  belongs_to :student
  belongs_to :team

  validates :number, :student_id, :team_id, presence: true
end
