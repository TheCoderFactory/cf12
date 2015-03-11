class FastTrackApplication < ActiveRecord::Base
	belongs_to :scholarship
	has_one :admission
	validates :phone, :first_name, :last_name, :city, :country, :email, :age, :gender, :one_line, :reason, :info, :passion, :experience, :challenge, :special, :links, :referral, presence: true
	validates :referral, length: { maximum: 200 }

	def full_name
		"#{first_name} #{last_name}"
	end
end
