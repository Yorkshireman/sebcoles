class AddUserIdToTestimonialsTable < ActiveRecord::Migration
  def change
  	add_column :testimonials, :student_id, :integer
  	add_index :testimonials, :student_id
  end
end
