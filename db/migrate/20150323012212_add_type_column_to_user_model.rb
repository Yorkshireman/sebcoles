class AddTypeColumnToUserModel < ActiveRecord::Migration
  def up
  	add_column :users, :type, :string, default: "Student"
  end

  def down
  	remove_column :users, :type
  end
end
