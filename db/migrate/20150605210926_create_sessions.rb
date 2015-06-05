class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
    	t.date :date
    	t.time :from
    	t.time :to
    	t.string :instructor
    	t.integer :course_id
    	t.string :address
    	t.string :postal_code
    	t.float :latitude
    	t.float :longitude
    	t.float :cost

      t.timestamps
    end
    add_index :sessions, :course_id
  end
end
