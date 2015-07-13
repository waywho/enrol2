module CoursesHelper

	def session_in_cart?(sess)
		@cart.line_items.map {|item| item.session.id }.include?(sess.id)
	end
end
