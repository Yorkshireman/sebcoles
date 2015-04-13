class StudentsController < UsersController

	def index
	end

	def show
		@groups = Group.all 	# So Groups can be shown in a Student's show view
	end

	def update
		respond_to do |format|
      		if @user.update(user_params)
        		format.html { redirect_to student_path, notice: 'Student was successfully updated.' }
        		format.json { render :show, status: :ok, location: @user }
      		else
        		format.html { render :edit }
        		format.json { render json: @user.errors, status: :unprocessable_entity }
      		end
    	end
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:student).permit(:group_ids)
    end

end