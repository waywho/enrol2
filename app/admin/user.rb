ActiveAdmin.register User do

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
index do
	selectable_column
	column :email
	column :first_name
	column :last_name
	column :current_sign_in_at
	column :last_sign_in_at
	column :current_sign_in_ip
	column :last_sign_in_ip
	column :created_at
	actions
end

show do
	h3 'User Details'
	attributes_table do
		row :id
		row :first_name
	    row :last_name
	    row :email
	    row :reset_password_sent_at
	    row :sign_in_count
	    row :current_sign_in_at    
	    row :current_sign_in_ip
	    row :last_sign_in_at
	    row :last_sign_in_ip
	    row :created_at
	    row :updated_at
	    row :sessions do
	    	table_for user.sessions do
	    		column :id
	    		column :start
	    	end
	    end
	end
end


form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :reset_password_token
    end
    f.actions
  end

permit_params :email, :first_name, :last_name, :reset_password_token

end
