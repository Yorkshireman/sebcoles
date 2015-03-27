class StaticPagesController < ApplicationController
  def home
  end

  def admin
  	@groups = Group.all

  	@users = User.all

  	@students = Student.all

  	@teachers = Teacher.all
  end
end
