ActiveAdmin.register Session do
	index do
		column :id
		column "Date", :from do |session|
			session.from.strftime("%d %b, %Y") 
		end
		column :from do |session|
			session.from.strftime("%H:%M") 
		end
	
		column :to do |session|
			session.to.strftime("%H:%M") 
		end
		column :instructor
		column :location
		column :cost
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
