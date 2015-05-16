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
  	unless signed_in? and current_user.admin == true
  		redirect_to root_path, notice: "You must be a signed-in admin to view this page"
  	end
  end

end
