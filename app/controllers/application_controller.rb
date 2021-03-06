class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:current_order, :has_order?]
  

  # Returns the active order for this session
  def current_order
    @current_order ||= begin
      if has_order?
        @current_order
      else
        order = Shoppe::Order.create(:ip_address => request.ip, :billing_country => Shoppe::Country.where(:name => "Australia").first)
        session[:order_id] = order.id
        order
      end
    end
  end
  
  # Has an active order?
  def has_order?
    session[:order_id] && @current_order = Shoppe::Order.includes(:order_items => :ordered_item).find_by_id(session[:order_id])
  end

  
 	helper_method :current_order, :has_order?, :promotion_value

	def capture_promotion_code
  	session[:promo_code] = params[:promo_code] if params[:promo_code]
    @promotion = Shoppe::Promotion.find_by(code: session[:promo_code])
  end

  def promotion_value

  	if @promotion && @promotion.is_valid?
  		@promotion.value
  	else
  		0
  	end
  end
end
