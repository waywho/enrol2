class CartsController < InheritedResources::Base
	before_action :authenticate_user!, :only => [:send_invoice]
	include CurrentCart
	before_action :set_cart
	
	def index
	end

	def show
		@items = @cart.line_items
	end

	def new
	end

	def edit
	end

	def create
	end

	def update
	end

	def destroy
	end

  	private

    def cart_params
      params.require(:cart).permit()
    end
end

