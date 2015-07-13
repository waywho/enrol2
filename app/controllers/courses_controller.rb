class CoursesController < ApplicationController
	include CurrentCart
	before_action :set_cart

	def index
		@courses = Course.all
		@line_item = LineItem.new
	end

	def show
		@course = Course.find(params[:id])
	end
end
