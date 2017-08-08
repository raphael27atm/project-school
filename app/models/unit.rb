class Unit < ApplicationRecord
  include ModuleAddess
  # relations
  has_many :students
  has_many :teams
  has_many :teachers

  validates :name, :school_id, presence: true

  def query_analytics

  end
end
