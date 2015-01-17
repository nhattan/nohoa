class Category < ActiveRecord::Base

	validates :name, presence: true

	class << self
		def permit_attributes
			[:name]
		end
	end
end
