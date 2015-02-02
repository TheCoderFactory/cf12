class HomeController < ApplicationController
	skip_before_action :authenticate_user!
  def index
  	@products = Shoppe::Product.active.featured.includes(:product_category, :variants)
    # @products = @products.group_by(&:product_category)
  end
end
