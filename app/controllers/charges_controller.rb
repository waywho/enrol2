class ChargesController < ApplicationController
	before_action :authenticate_user!
	include CurrentCart
	before_action :set_cart

	def new
	end

	def create

	  # Amount in cents
	  	@amount = (@cart.line_items.to_a.sum(&:get_cost) *100).to_i

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
		
		@cart.line_items.each do |item|
			current_user.enrollments.create(session_id: item.session.id)
		end

		@cart.update_attributes(purchased_at: Time.now, user_id: current_user.id, cost: @amount)

		redirect_to thank_you_path(@cart)

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to root_path
	end

	def send_invoice
		NotificationMailer.request_invoice(@cart, current_user).deliver

		@cart.line_items.each do |item|
			current_user.enrollments.create(session_id: item.session.id)
		end

		@cart.update_attributes(purchased_at: Time.now, user_id: current_user.id, cost: @amount)

		redirect_to thank_you_invoice_path(@cart)
	end
end
