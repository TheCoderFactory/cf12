class OrdersController < ApplicationController
  skip_before_action :authenticate_user!
  before_filter(:except => :status) { redirect_to root_path unless has_order? }
  
  def status
    @order = Shoppe::Order.find_by_token!(params[:token])
  end
  
  def destroy
    current_order.destroy
    session[:order_id] = nil
    respond_to do |wants|
      wants.html { redirect_to root_path, :notice => "Your basket has been emptied successfully."}
      wants.json do
        flash[:notice] = "Your shopping bag is now empty."
        render :json => {:status => 'complete', :redirect => root_path}
      end
    end
  end
  
  def remove_item
    item = current_order.order_items.find(params[:order_item_id])
    if current_order.order_items.count == 1
      destroy
    else
      item.remove
      respond_to do |wants|
        wants.html { redirect_to request.referer, :notice => "Item has been removed from your basket successfully"}
        wants.json do
          current_order.reload
          render :json => {:status => 'complete', :items => render_to_string(:partial => 'shared/order_items.html', :locals => {:order => current_order})}
        end
      end
    end
  end
  
  def change_item_quantity
    item = current_order.order_items.find(params[:order_item_id])
    request.delete? ? item.decrease! : item.increase!
    respond_to do |wants|
      wants.html { redirect_to request.referer || root_path, :notice => "Quantity has been updated successfully." }
      wants.json do
        current_order.reload
        if current_order.empty?
          destroy
        else
          render :json => {:status => 'complete', :items => render_to_string(:partial => 'shared/order_items.html', :locals => {:order => current_order})}
        end
      end
    end    
  rescue Shoppe::Errors::NotEnoughStock => e
    respond_to do |wants|
      wants.html { redirect_to request.referer, :alert => "Unfortunately, we don't have enough stock. We only have #{e.available_stock} items available at the moment. Please get in touch though, we're always receiving new stock." }
      wants.json { render :json => {:status => 'error', :message => "Unfortunateley, we don't have enough stock to add more items."} }
    end
  end

  def change_delivery_service
    if current_order.delivery_service = current_order.available_delivery_services.select { |s| s.id == params[:delivery_service].to_i}.first
      current_order.save
      respond_to do |wants|
        wants.html { redirect_to request.referer, :notice => "Delivery service has been changed"}
        wants.json do
          current_order.reload
          render :json => {:status => 'complete', :items => render_to_string(:partial => 'shared/order_items.html', :locals => {:order => current_order})}
        end
      end
    else
      respond_to do |wants|
        wants.html { redirect_to request.referer, :alert => "You cannot select this delivery method."}
        wants.json { render :json => {:status => 'error', :message => 'InvalidDeliveryMethod'}, :status => 422 }
      end
    end
  end
  
  def checkout
    @order = Shoppe::Order.find(current_order.id)
    if request.patch?
      @order.attributes = params[:order].permit(:first_name,
                                                :last_name, 
                                                :company, :billing_address1, :billing_address2, :billing_address3, :billing_address4, :billing_country_id, :billing_postcode, :email_address, :phone_number, :delivery_name, :delivery_address1, :delivery_address2, :delivery_address3, :delivery_address4, :delivery_postcode, :delivery_country_id, :separate_delivery_address)
      @order.ip_address = request.ip
      @order.save
      redirect_to checkout_payment_path
    end
  end
  
  def payment
    @order = Shoppe::Order.find(current_order.id)
    Stripe.api_key = Shoppe.settings.stripe_api_key
    
    customer = Stripe::Customer.create(
      :card => params[:stripeToken],
      :email => current_order.email_address
    )

    charge = Stripe::Charge.create(
        :amount => current_order.total.to_i * 100, # in cents
        :currency => "aud",
        :description => "Order number: " + current_order.id.to_s,
        :customer => customer.id
    )
    if charge["paid"] == true
      current_order.confirm!
      current_order.payments.create(:method => "Credit Card", :amount => current_order.total, :reference => rand(10000) + 10000, :refundable => true)
      session[:order_id] = nil
      EnrolmentMailer.received.deliver
      redirect_to new_pre_questionnaire_path(order: @order.id), :notice => "Your place in these courses have been booked!"
    end

  rescue Stripe::CardError => e
      # flash[:error] = e.message
      # render :confirmation
      flash[:alert] = "Payment was declined by the bank. #{e.message}"
      redirect_to checkout_confirmation_path
      # rescue Shoppe::Errors::PaymentDeclined => e
      #   flash[:alert] = "Payment was declined by the bank. #{e.message}"
      #   redirect_to checkout_payment_path
      # rescue Shoppe::Errors::InsufficientStockToFulfil
      #   flash[:alert] = "We're terribly sorry but while you were checking out we ran out of stock of some of the items in your basket. Your basket has been updated with the maximum we can currently supply. If you wish to continue just use the button below."
      #   redirect_to checkout_payment_path
  end
  
  def confirmation
    @order = Shoppe::Order.find(current_order.id)
  end
    
end
