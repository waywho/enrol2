class PaymentNotification < ActiveRecord::Base
	belongs_to :cart
	serialize :params
	after_create :mark_cart_as_purchased

	private

	def mark_cart_as_purchased
		payment = PaymentNotification.find_by(cart_id: cart.id)
		if status == "Completed" && params[:secret] == APP_CONFIG[:paypal_secret] &&
     	 	params[:receiver_email] == APP_CONFIG[:paypal_email] &&
      		params[:mc_currency] == "GBP"
			cart.update_attribute(:purchased_at, Time.now)
			cart.line_items.each do |item|
				Enrollment.create(user_id: payment.user_id, session_id: item.session.id)
			end
		end
	end

end