class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :providers, dependent: :destroy
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  accepts_nested_attributes_for :providers

  def admin?
    roles.map(&:name).include?("admin")
  end

  def email_required?
    false
  end

  def password_required?
    false
  end

  class << self
  	def from_omniauth(auth)
  	  attrs = { provider: auth.provider, uid: auth.uid,
          		oauth_token: auth.credentials.token,
          		oauth_expires_at: Time.at(auth.credentials.expires_at) }

  	  provider = Provider.where(auth.slice(:provider, :uid)).first
  	  user = provider.try(:user)
  	  if user
  	  	provider.update_attributes(attrs)
  	  else
  	  	user = User.create(providers_attributes: [attrs])
  	  end

  	  user.reload
  	end

    def permit_attributes
      [:email, :password, :password_confirmation]
    end
  end
end
