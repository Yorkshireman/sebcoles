module ApplicationHelper

	def verified_user? #checks that a user is either a student, teacher or an admin
		current_user.type == "Student" || current_user.type == "Teacher" || current_user.admin
	end

	def assigned_to_a_group?
		current_user.groups != nil
	end

end
