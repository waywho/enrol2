class StaticPagesController < ApplicationController
	include CurrentCart
	before_action :set_cart

	def index
	end

	def about
	end

	def faq
	end
end
