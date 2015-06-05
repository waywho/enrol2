class Enrollment < ActiveRecord::Base
	belongs_to :sessions
	belongs_to :users
end
