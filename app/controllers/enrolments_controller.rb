class EnrolmentsController < ApplicationController
  def index
  	# @upcoming_courses = Shoppe::Product.active.where('parent_id != ? AND start_date >= ?', nil, DateTime.now).order(name: :asc)
  	@future_courses = Shoppe::Product.active
  end
end