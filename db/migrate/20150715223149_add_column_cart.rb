class AddColumnCart < ActiveRecord::Migration
  def change
  	add_column :carts, :invoice_request_date, :datetime
  end
end
