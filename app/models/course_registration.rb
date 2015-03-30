class CourseRegistration < ActiveRecord::Base
	validates :first_name, :email, presence: true

  def self.reverse_order
  	order(created_at: :desc)
  end
end
