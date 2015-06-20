class PaymentNotificationsController < InheritedResources::Base
	protect_from_forgery :except => [:create]

	def create
		PaymentNotification.create!(:params => params, :cart_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:transaction_id])
		render :nothing => true
	end

  private

    def payment_notification_params
      params.require(:payment_notification).permit(:params, :cart_id, :status, :transaction_id, :create)
    end
end

