class ChangeColumnSession < ActiveRecord::Migration
  def change
  	remove_column :sessions, :from
  	remove_column :sessions, :to
  	add_column :sessions, :from, :datetime
  	add_column :sessions, :to, :datetime
  end
end
