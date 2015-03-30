class EnrolmentsController < ApplicationController
  def index
  	# @upcoming_courses = Shoppe::Product.active.where('parent_id != ? AND start_date >= ?', nil, DateTime.now).order(name: :asc)
  	@future_courses = Shoppe::Product.active.where('start_date >= ?', Date.today).order(start_date: :asc)
  	# Shoppe::Order.ordered.received.includes(:order_items => :ordered_item)
  end

  def show
  	@course = Shoppe::Product.find(params[:id])
  	@students = @course.orders.ordered.received
  end
end
