class LineItemsController < InheritedResources::Base
	include CurrentCart
	before_action :set_cart, only: [:create]
	before_action :set_line_item, only: [:show, :eidt, :update, :destroy]

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
		session = Session.find(params[:session_id])
		@line_item = @cart.line_items.create(session: session)

		flash[:notice] = "Added #{session.date} to cart."

		redirect_to course_path(session.course_id)

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

	end

  private

    def line_item_params
      params.require(:line_item).permit(:session_id, :cart_id)
    end
end

