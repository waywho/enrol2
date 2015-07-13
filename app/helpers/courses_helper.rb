module CoursesHelper

	def session_in_cart?(sess)
		@cart.line_items.map(&:session_id).include?(sess.id)
	end
end
