module CoursesHelper

	def session_in_cart?(sess)
		if @cart
			@cart.line_items.map(&:session_id).include?(sess.id)
		else
			false
		end
	end
end
