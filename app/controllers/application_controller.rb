class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admin?
  	if current_user.admin == true
  		return true
  	end
  end
  
  def user_is_admin_or_teacher_or_student_with_a_class
    if user_signed_in? and ( current_user.admin || current_user.type == "Teacher" || ( (current_user.type == "Student") and current_user.groups.any? ) )
    else redirect_to root_path, notice: "You are not authorised to view the Materials page."
    end
  end

end
