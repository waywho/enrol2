class CartsController < InheritedResources::Base
	include CurrentCart
	before_action :find_cart
	
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

