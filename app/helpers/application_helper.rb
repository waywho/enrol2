module ApplicationHelper
	def date_display(datetime)
		datetime.to_s(:start_date) if datetime.present?
	end

	def date_display2(datetime)
		datetime.strftime("%A %d %B %Y") if datetime.present?
	end

	def time_display(datetime)
		datetime.to_s(:time_display) if datetime.present?
	end

	def start_time_display(datetime)
		datetime.to_s(:start_time) if datetime.present?
	end

	def end_time_display(datetime)
		datetime.to_s(:end_time) if datetime.present?
	end
end