class ChargesController < ApplicationController
	include CurrentCart
	before_action :set_cart

	def new
	end

	def create
		if @cart.total_price_with_card.zero?
	  # Amount in cents
	  	@amount = (total_price_w_card(@cart) *100).to_i

		 customer = Stripe::Customer.create(
		   :email => current_user.email,
		   :card  => params[:stripeToken]
		 )

		 charge = Stripe::Charge.create(
		   :customer    => customer.id,
		   :amount      => @amount,
		   :description => 'Course Registration',
		   :currency    => 'gbp'
		 )
		end

		@cart.line_items.each do |item|
			current_user.enrollments.create(session_id: item.session.id)
		end

		@cart.update_attributes(purchased_at: Time.now, user_id: current_user.id, cost: (@amount/100))

		redirect_to thank_you_path(@cart)

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to root_path
	end

	def send_invoice
		@amount = @cart.line_items.to_a.sum(&:get_cost)
		NotificationMailer.request_invoice(@cart, current_user).deliver

		@cart.line_items.each do |item|
			current_user.enrollments.create(session_id: item.session.id)
		end
		@cart.update_attributes(invoice_request_date: Time.now, user_id: current_user.id, cost: @amount)

		redirect_to thank_you_invoice_path(@cart)
	end

	private

	def total_price_w_card(cart)
		if cart.line_items.to_a.sum(&:get_cost) == 0
			cart.line_items.to_a.sum(&:get_cost)
		else
			cart.line_items.to_a.sum(&:get_cost) * 1.019 + 0.2
		end
	end
end
