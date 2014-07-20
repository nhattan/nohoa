class UserRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :role

  validates :role_id, presence: true, uniqueness: {scope: [:user_id]}
end
