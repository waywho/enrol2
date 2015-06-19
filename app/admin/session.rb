ActiveAdmin.register Session do
	index do
		column :id
		column :date
		column :from
		column :to
		column :instructor
		column :location
		column :address
		column :postal_code
		column :cost
		column :user_id
		actions
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

permit_params :date, :from, :to, :instructor, :course_id, :location, :address, :postal_code, :latitude, :longitude, :cost

end
