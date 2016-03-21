module CurrentCart
	extend ActiveSupport::Concern

	private

	def set_cart
		if session[:cart_id].present?
			@cart = Cart.find(session[:cart_id])
			session[:cart_id] = nil if @cart.purchased_at
		end
		if session[:cart_id].nil?
			@cart = Cart.create!
			session[:cart_id] = @cart.id
		end
		@cart
	end

end