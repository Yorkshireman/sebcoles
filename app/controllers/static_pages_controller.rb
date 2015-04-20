class StaticPagesController < ApplicationController
	before_action :admin?, only: [:admin]

  def home
    @testimonials = Testimonial.all
  end

  def admin
  	@groups = Group.all

  	@users = User.all

  	@students = Student.all

  	@teachers = Teacher.all
  end

  private

  def admin?
  	unless current_user.admin
  		redirect_to root_path, notice: "You must be an admin to view this page"
  	end
  end

end
