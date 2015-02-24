class CourseEnrolmentsController < ApplicationController
  def index
  	@enrolments = Shoppe::OrderItem.all
  end
end
