class Admission < ActiveRecord::Base
  belongs_to :fast_track_application
  # validates :name, :email, :phone, :street_address, :city, :postcode, :state, :country, :programme, :payment_plan, :agreement, presence: true
end
