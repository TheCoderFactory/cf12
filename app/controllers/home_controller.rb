class HomeController < ApplicationController
	skip_before_action :authenticate_user!
  def index
  	@courses = Shoppe::Product.where(product_category: nil)
  	@upcoming_courses = @courses.where('start_date >= ?', Date.today).limit(5).order(start_date: :asc)
  	# @products = Shoppe::Product.active.featured.includes(:product_category, :variants)
    # @products = @products.group_by(&:product_category)
  end
end
