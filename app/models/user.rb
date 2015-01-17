class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :providers, dependent: :destroy
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  accepts_nested_attributes_for :providers
  accepts_nested_attributes_for :user_roles

  def admin?
    roles.map(&:name).include?("admin")
  end

  def email_required?
    !self.providers.any?
  end

  def password_required?
    !self.providers.any? && new_record?
  end

  def build_user_roles
    user_roles.first || user_roles.build
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
      [:email, :password, :password_confirmation, user_roles_attributes: [:role_id, :id]]
    end
  end
end
