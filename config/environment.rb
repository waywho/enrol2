# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Time::DATE_FORMATS[:from_date] = "%a, %d %B, %Y"
Time::DATE_FORMATS[:from_time] = "from %H:%M"
Time::DATE_FORMATS[:to_time] = "to %H:%M"
Time::DATE_FORMATS[:time_display] = "%H:%M"