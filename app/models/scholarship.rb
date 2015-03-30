class Scholarship < ActiveRecord::Base
	has_many :fast_track_applications

	def self.available
		where(available: true)
	end
end
