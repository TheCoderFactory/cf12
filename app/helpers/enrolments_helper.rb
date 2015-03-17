module EnrolmentsHelper
	def enrolment_count(product)
		Shoppe::Order.ordered.received.includes(:products).where(products: { id: product.id }).count
	end
end

# the number of received orders with an order item that is the name of the product

# Shoppe::OrderItem.where(ordered_item_id: future_course.id).count