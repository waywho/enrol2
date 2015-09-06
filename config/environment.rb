# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Time::DATE_FORMATS[:start_date] = "%A, %d %B, %Y"
Time::DATE_FORMATS[:start_time] = "from %H:%M"
Time::DATE_FORMATS[:end_time] = "to %H:%M"
Time::DATE_FORMATS[:time_display] = "%H:%M"