class ChangeColumnsSessions < ActiveRecord::Migration
  def change
  	rename_column :sessions, :from, :start
  	rename_column :sessions, :to, :end
  end
end
