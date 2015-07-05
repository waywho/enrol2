class AddColumnToPaymentNotificiations < ActiveRecord::Migration
  def change
  	add_column :payment_notifications, :user_id, :integer
  end
end
