class Teacher < ActiveRecord::Base
	has_many :course_teachers
	has_many :shoppe_products, through: :course_teachers

	extend FriendlyId
	friendly_id :name, use: :slugged
end
