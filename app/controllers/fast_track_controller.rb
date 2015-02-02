class FastTrackController < ApplicationController
	skip_before_action :authenticate_user!
  def index
  	@course_registration = CourseRegistration.new
  	@partner = Partner.new
  end
end
