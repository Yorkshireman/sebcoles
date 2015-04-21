class TeachersController < UsersController

	def index
	end

	def show
	end

	def assign_as_student
		@user = User.find(params[:user_id])
		@user.update_attributes(type: "Student")
		@user.save
		redirect_to admin_path, notice: "They are now a Student" 
	end

end