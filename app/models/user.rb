class User < ApplicationRecord
  belongs_to :role
  has_many :events
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
 :omniauthable, :omniauth_providers => [:google]
 validates :first_name, presence: true
 validates :last_name, presence: true
 validates :dob, presence: true
 validates :mobile, presence: true, numericality: { only_integer: true }
 validates :email, presence: true
 validates :password, presence: true

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end




  def admin?
    if self.role_id == 1
      true
    else
      false
    end
  end
end
