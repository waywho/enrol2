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

	form do |f|
		f.inputs do
		f.input :course_id, as: :select, :collection => Course.all
		f.input :instructor
		f.input :location
		f.input :address
		f.input :postal_code
		f.input :cost
		f.input :start, as: :just_datetime_picker
		f.input :end, as: :just_datetime_picker
		end
		actions
	end

	show do
		attributes_table do
			row :start
			row :location
			row :instructor
			row 'Users' do
				table_for session.users do
					column :email
				end
			end

		end
	end

	member_action :clone, method: :get do
		@resource = resource.dup
		render :new, layout: false
	end

	action_item :only => :show do
		link_to("Make a Copy", clone_admin_session_path(id: session.id))
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

permit_params :start, :end, :start_date, :start_time_hour, :start_time_minute, :end_date, :end_time_hour, :end_time_minute, :instructor, :course_id, :location, :address, :postal_code, :latitude, :longitude, :cost

end
