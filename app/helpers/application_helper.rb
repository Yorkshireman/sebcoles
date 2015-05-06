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


end
