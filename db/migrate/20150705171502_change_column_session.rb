class ChangeColumnSession < ActiveRecord::Migration
  def change
  	change_column :sessions, :from, :datetime
  	change_column :sessions, :to, :datetime
  end
end
