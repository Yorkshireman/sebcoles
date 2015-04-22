module ApplicationHelper

	def any_unassigned_users?
  	array = Array.new
  	users = User.all
  	users.each do |user|
  		if user.type == nil
  			array << user
  		end
  	end
  	array.count > 0
	end

  def student?
    current_user.type == "Student"
  end

  def teacher?
    current_user.type == "Teacher"
  end

	def verified_user? #checks that the current_user is either a student, teacher or an admin
		current_user.type == "Student" || current_user.type == "Teacher" || current_user.admin
	end

	def student_assigned_to_a_group? #checks if the current_user is a student currently assigned to a group
		assigned = "no"

		Group.all.each do |group|
			array = []
			group.students.each do |student|
				array << student
			end

			if (array.include? current_user) == true
				assigned = "yes"
			end

		end

		assigned == "yes"
	end

end
