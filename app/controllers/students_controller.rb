class StudentsController < UsersController

	def index
	end

	def show
		@groups = Group.all 	# So Groups can be shown in a Student's show view
	end

	def assign_to_group
		@user=User.find(params[:user_id])
		@group=Group.find(params[:group_id])
		@user.groups << @group unless @user.groups.include? @group
		@user.save!
		redirect_to user_path @user
	end

	def remove_from_group
		@user=User.find(params[:user_id])
		@group=Group.find(params[:group_id])
		@user.groups.delete @group
		@user.save!
		redirect_to user_path @user
	end

	def assign_as_teacher
		@user = User.find(params[:user_id])
		@user.update_attributes(type: "Teacher")
		@user.save
		redirect_to admin_path, notice: "They are now a Teacher" 
	end

end