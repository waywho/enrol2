class StaticPagesController < ApplicationController
	include CurrentCart
	before_action :set_cart, except: :thank_you

	def index
	end

	def about
	end

	def faq
	end

	def thank_you
		@cart = Cart.find(params[:cart_id])
		@items = @cart.line_items
	end

	def thank_you_invoice
		@cart = Cart.find(params[:cart_id])
		@items = @cart.line_items
	end
end
