class ProductsController < ApplicationController
  skip_before_action :authenticate_user!
  before_filter do
    if params[:category_id]
      @product_category = Shoppe::ProductCategory.where(:permalink => params[:category_id]).first!
    end
    if @product_category && params[:product_id]
      @product = @product_category.products.where(:permalink => params[:product_id]).active.first!      
    end
  end
  respond_to :html, :json

  def index
    @products = @product_category.products.includes(:product_category, :variants).root.active
  end
  
  def filter
    @products = Shoppe::Product.active.with_attributes(params[:key].to_s, params[:value].to_s)
  end
  
  def categories
    # @product_categories = Shoppe::ProductCategory.ordered
    @products = Shoppe::Product.where(parent_id: nil)
    respond_with :html, :json
  end
  
  def show
    @attributes = @product.product_attributes.public.to_a
    @product_variants = @product.variants
    @next_course = @product_variants.where('start_date >= ?', Date.today).order(start_date: :asc).first
    @upcoming_courses = @product_variants.where('start_date >= ?', Date.today).order(start_date: :asc).limit(5)
    @teacher = Teacher.find(@product.product_attributes.find_by(key: 'teacher').value)
  end
  
  def add_to_basket
    product_to_order = params[:variant] ? @product.variants.find(params[:variant].to_i) : @product
    current_order.order_items.add_item(product_to_order, params[:quantity].blank? ? 1 : params[:quantity].to_i)
    respond_to do |wants|
      wants.html { redirect_to checkout_path }
      wants.json { render :json => {:added => true} }
    end
  rescue Shoppe::Errors::NotEnoughStock => e
    respond_to do |wants|
      wants.html { redirect_to request.referer, :alert => "We're sorry but we don't have enough stock to add that many products. We currently have #{e.available_stock} item(s) in stock. Please try again."}
      wants.json { render :json => {:error => 'NotEnoughStock', :available_stock => e.available_stock}}
    end
  end
  
end