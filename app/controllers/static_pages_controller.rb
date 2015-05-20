class StaticPagesController < ApplicationController
	before_action :an_admin?, only: [:admin]

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

  def an_admin?
    unless signed_in? && (current_user.admin == true) 
      redirect_to root_path, notice: "You have to be a signed-in admin to view the admin page"
    end
  end

end
