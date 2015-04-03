class StudentsController < UsersController

	def index
	end

	def show
		@groups = Group.all
	end

end