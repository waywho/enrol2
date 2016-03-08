ActiveAdmin.register Session do
	index do
		selectable_column
		id_column
		column "Date" do |session|
			date_display(session.start)
		end
		column :start do |session|
			time_display(session.start)
		end
	
		column :end do |session|
			time_display(session.end)
		end
		column :instructor
		column :location
		column :cost
		column 'Number' do |session|
			session.enrollments.size
		end
		actions
	end

	show do
		attributes_table do
			row "Date", :start
			row :location
			row :instructor
			row 'Users' do
				table_for session.users do
					column :email
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

permit_params :start, :to, :instructor, :course_id, :location, :address, :postal_code, :latitude, :longitude, :cost

end
