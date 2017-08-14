class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # relations
  belongs_to :role       
  belongs_to :school

  validates :role_id, :name, :school_id, presence: true
  validates :auth_token, uniqueness: true

  def generate_auth_token
    loop do
      token = Devise.friendly_token
      break token unless self.class.exists?(auth_token: token)
    end
  end

  def ensure_authentication_token
    return if self.auth_token.present?
    self.auth_token = generate_auth_token
    self.save
  end

end
