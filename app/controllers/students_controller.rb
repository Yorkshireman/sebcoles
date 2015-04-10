class StudentsController < UsersController

	def index
	end

	def show
		@groups = Group.all
	end

	def assign_to_group
		@user=User.find(params[:user_id])
		@group=Group.find(params[:title])
		@user.groups << @group
	end

end