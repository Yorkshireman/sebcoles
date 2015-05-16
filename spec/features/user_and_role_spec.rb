require 'rails_helper'

describe 'with users and roles' do 
	
	def log_in_as(user)
		visit new_user_session_path
		fill_in('user_email', :with => user.email)
		fill_in('user_password', :with => user.password)
		click_button("Log in")
	end

	let(:unassigned_non_admin_user) { User.create(first_name: 'Test', last_name: 'User', email: 'test@example.com', password: 'password', type: nil) }
	let(:student)					{ User.create(first_name: 'Test', last_name: 'User', email: 'test@example.com', password: 'password', type: "Student") }
	let(:teacher)					{ User.create(first_name: 'Test', last_name: 'User', email: 'test@example.com', password: 'password', type: "Teacher") }	
	let(:admin_user) 				{ User.create(first_name: 'Test', last_name: 'User', email: 'test@example.com', password: 'password', type: nil, admin: true) }
	let(:teacher_admin_user) 		{ User.create(first_name: 'Test', last_name: 'User', email: 'test@example.com', password: 'password', type: "Teacher", admin: true) }

	it "does not allow any user to visit the admin page if not logged-in" do
		visit(admin_path)
		expect(current_path).to eq(root_path)
	end

	it "allows an admin_user to view the admin page" do 
		log_in_as(admin_user)
		visit(admin_path)
		expect(current_path).to eq(admin_path)
	end

	it "allows a teacher_admin to view the admin page" do 
		log_in_as(teacher_admin_user)
		visit(admin_path)
		expect(current_path).to eq(admin_path)
	end

	it "does not allow a unassigned_non_admin_user to visit admin page" do
		log_in_as(unassigned_non_admin_user)
		visit(admin_path)
		expect(current_path).to eq(root_path)
	end

	it "does not allow a student to visit the admin page" do 
		log_in_as(student)
		visit(admin_path)
		expect(current_path).to eq(root_path)
	end

	it "does not allow a teacher to visit the admin page" do 
		log_in_as(teacher)
		visit(admin_path)
		expect(current_path).to eq(root_path)
	end

end