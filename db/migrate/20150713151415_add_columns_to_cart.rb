class AddColumnsToCart < ActiveRecord::Migration
  def change
  	add_column :carts, :user_id, :integer
  	add_column :carts, :cost, :float

  	add_index :carts, :user_id
  end
end
