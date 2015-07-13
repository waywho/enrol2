module ApplicationHelper
	def date_display(datetime)
		datetime.to_s(:from_date) if datetime.present?
	end

	def date_display2(datetime)
		datetime.strftime("%A %d %B %Y") if datetime.present?
	end

	def time_display(datetime)
		datetime.to_s(:time_display) if datetime.present?
	end

	def from_time_display(datetime)
		datetime.to_s(:from_time) if datetime.present?
	end

	def to_time_display(datetime)
		datetime.to_s(:to_time) if datetime.present?
	end
end