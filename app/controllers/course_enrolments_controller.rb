class CourseEnrolmentsController < ApplicationController
  def index
  	@enrolments = Shoppe::Order.all
  end
end
