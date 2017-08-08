class Responsible < ApplicationRecord
  include SelectForSchool
  # relations
  belongs_to :student

  validates :name, :student_id, presence: true
end
