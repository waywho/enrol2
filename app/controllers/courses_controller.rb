class CoursesController < ApplicationController
	include CurrentCart
	before_action :set_cart

	def index
		@courses = Course.all
		@line_item = LineItem.new
	end

	def show
		@line_item = LineItem.new
		@course = Course.find(params[:id])
		@sessions = @course.sessions.where("start > ?", DateTime.now)
	end
end
