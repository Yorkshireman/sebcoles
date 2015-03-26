class ModifyGroupsStudentsJoinTable < ActiveRecord::Migration
  def change
  	drop_table :groups_students
  	create_join_table :groups, :students
  end
end
