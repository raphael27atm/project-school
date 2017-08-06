class Teacher < ApplicationRecord
  # relations
  belongs_to :unit

  validates :name, :unit_id, presence: true
end
