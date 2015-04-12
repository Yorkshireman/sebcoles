class StudentsController < UsersController

	def index
	end

	def show
		@groups = Group.all 	# So Groups can be shown in a Student's show view
	end

	def assign_to_group
		@user=User.find(params[:user])
		@group=Group.find(params[:group])
		@user.groups << @group
	end

end