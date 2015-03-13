class PositionApplication < ActiveRecord::Base
	validates :phone, :name, :email, :phone, :reason, :experience, :special, :linkedin, presence: true
	
end
