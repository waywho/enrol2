ActiveAdmin.register Cart do

show do
	attributes_table do
		row :id
		row :created_at
		row :updated_at
		row :purchased_at
		row :user
		row :cost
		row :invoice_requested_date
		row 'Sessions' do
			table_for cart.line_items do
				column :session
				column (:session_date) { |line| line.session.start}
			end
		end

	end

end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
