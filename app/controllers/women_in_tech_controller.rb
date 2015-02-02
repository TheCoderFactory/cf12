class WomenInTechController < ApplicationController
	skip_before_action :authenticate_user!
  def index
  	@scholarships = Scholarship.all
  end
end
