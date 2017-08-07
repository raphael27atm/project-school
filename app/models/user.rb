class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # relations
  belongs_to :role       
  belongs_to :school
  before_create :set_default_role
  
  validates :role, :name, :school_id, presence: true

  private
  
  def set_default_role
    self.role ||= Role.find_by_name('registered')
  end
end
