class Enquiry < ActiveRecord::Base
	validates :name, :email, :content, presence: true

	def self.reverse_order
		order(created_at: :desc)
	end
end
