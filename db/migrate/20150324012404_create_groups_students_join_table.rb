class CreateGroupsStudentsJoinTable < ActiveRecord::Migration
  def up
  	create_table :groups_students, id: false do |t|
  		t.integer :group_id
  		t.integer :student_id
  	end

  	add_index :groups_students, :group_id
  	add_index :groups_students, :student_id
  end

  def down
  	drop_table :groups_students
  end
end
