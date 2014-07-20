class Provider < ActiveRecord::Base
  belongs_to :user

  validates :uid, presence: true, uniqueness: true
  validates :oauth_token, :oauth_expires_at, :provider, presence: true
end
