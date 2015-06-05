class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
    	t.integer :user_id
    	t.integer :session_id

      t.timestamps
    end

    add_index :enrollments, [:user_id, :session_id]
    add_index :enrollments, :session_id
  end
end
