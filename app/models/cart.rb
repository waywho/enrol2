class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
	belongs_to :user
	after_update :send_confirm_email

	def total_price
		line_items.to_a.sum(&:get_cost)
	end

	def total_price_with_card
		if line_items.to_a.sum(&:get_cost) == 0
			line_items.to_a.sum(&:get_cost)
		else
			(line_items.to_a.sum(&:get_cost) + 0.2) / (1 - 0.014)
		end
	end

	def send_confirm_email
		NotificationMailer.session_signed_up(self).deliver
	end
end

