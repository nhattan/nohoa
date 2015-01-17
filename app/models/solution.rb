class Solution < ActiveRecord::Base
	belongs_to :user
	belongs_to :bug
	belongs_to :category

	validates :content, :category_id, presence: true
	validates :user, presence: true

	def require_user?
		true
	end	

	class << self
		def permit_attributes
			[:content, :category_id]
		end
	end
end
