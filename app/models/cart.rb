class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
	belongs_to :user
	after_update :send_confirm_email

	def total_price
		line_items.to_a.sum(&:get_cost)
	end

	def send_confirm_email
		NotificationMailer.session_signed_up(self).deliver
	end

	def send_invoice
		NotificationMailer.request_invoice(self, current_user).deliver
	end

end

