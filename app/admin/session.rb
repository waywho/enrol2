ActiveAdmin.register Session do
	index do
		column :id
		column "Date", :from do |session|
			date_display(session.from)
		end
		column :from do |session|
			time_display(session.from)
		end
	
		column :to do |session|
			time_display(session.to)
		end
		column :instructor
		column :location
		column :cost
		column 'Number', :enrollments do |session|
			session.enrollments.count
		end
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

permit_params :from, :to, :instructor, :course_id, :location, :address, :postal_code, :latitude, :longitude, :cost

end
