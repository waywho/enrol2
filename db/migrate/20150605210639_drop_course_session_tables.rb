class DropCourseSessionTables < ActiveRecord::Migration
  def change
  	drop_table :courses
  	drop_table :sessions
  end
end
