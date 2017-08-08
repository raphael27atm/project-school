class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # relations
  belongs_to :role       
  belongs_to :school

  validates :role_id, :name, :school_id, presence: true
end
