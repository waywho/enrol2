module CurrentCart
	extend ActiveSupport::Concern

	private

	def find_cart
		if session[:cart_id].present?
			if Cart.exists?(id: session[:cart_id])
				@cart = Cart.find(session[:cart_id])
				session[:cart_id] = nil if @cart.purchased_at || @cart.invoice_request_date
			else
				session[:cart_id] = nil
			end
		end
	end
	def set_cart
		if session[:cart_id].nil?
			@cart = Cart.create!
			session[:cart_id] = @cart.id
		end
	end
end