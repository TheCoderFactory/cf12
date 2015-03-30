class PostCategory < ActiveRecord::Base
	has_many :posts

	def self.order_by_post_count
		
	end
end

