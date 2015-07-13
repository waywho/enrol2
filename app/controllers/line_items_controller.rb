class LineItemsController < InheritedResources::Base
	include CurrentCart
	before_action :set_cart, only: [:create, :destroy]
	before_action :set_line_item, only: [:show, :edit, :update, :destroy]

	def index
	end

	def show
	end

	def new
		@line_item = LineItem.new
	end

	def edit
	end

	def create
		params[:session_ids].each do |sess_id|
			session = Session.find_by(:id => sess_id)
			@cart.line_items.create(session: session)
		end

		flash[:notice] = "Added your selected sessions to cart."

		redirect_to courses_path

		# respond_to do |format|
		# 	if @line_item.save
		# 		format.html { redirect_to @line_item.cart,
		# 			notice: 'Line item was successfully created.' }
		# 		format.json { render action: 'show',
		# 			status: :created, location: @line_item }
		# 	else
		# 		format.html { render action: 'new' }
		# 		format.json { render json: @line_item.errors,
		# 			status: :unprocessable_entity }
		# 	end
		# end
	end

	def update
	end

	def destroy
		# @line_item = @cart.line_items.find(params[:id])
		@line_item.destroy

		flash[:notice] = "Session removed"
		redirect_to cart_path(@cart)
	end

  private
  	def set_line_item
  		@line_item = LineItem.find(params[:id])
  	end

    def line_item_params
      params.require(:line_item).permit(:session_id, :cart_id, :session_ids)
    end
end

