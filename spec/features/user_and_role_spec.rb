require 'rails_helper'
	
	def manually_create_user
		visit new_user_registration_path
		fill_in('user_first_name', :with => 'Test')
		fill_in('user_last_name', :with => 'User')
		fill_in('user_email', :with => 'testuser@email.com')
		fill_in('user_password', :with => 'testuser')
		fill_in('user_password_confirmation', :with => 'testuser')
		click_button('Sign up')
	end

	def create_user_and_login_as(type)
		user = FactoryGirl.create(type)
		visit(new_user_session_path)
		fill_in('user_email', :with => user.email)
		fill_in('user_password', :with => user.password)
		click_button('Log in')
	end


describe 'with users and roles' do 	

	context "if user is not an admin" do

		it "makes sure Login/Logout works" do
			visit(root_path)
			click_link("Sign up")
			fill_in('user_email', :with => "testuser@email.com")
			fill_in('user_first_name', :with => "Test")
			fill_in('user_last_name', :with => "User")
			fill_in('user_password', :with => "password")
			fill_in('user_password_confirmation', :with => "password")
			click_button "Sign up"
			expect(current_path).to eq(root_path)
			expect(page).to have_content('Welcome! You have signed up successfully.')
		end

		it "does not allow any user to visit the admin page if not logged-in" do
			visit(admin_path)
			expect(current_path).to eq(root_path)
		end

		# it "does not allow a new user to visit the admin page" do
		# 	manually_create_user
		# 	visit(admin_path)
		# 	expect(current_path).to eq(root_path)
		# end

		# it "does not allow a student to visit the admin page" do 
		# 	create_user_and_login_as(:student)
		# 	visit admin_path
		# 	expect(current_path).to eq(root_path)
		# end

		# it "does not allow a teacher to visit the admin page" do 
		# 	create_user_and_login_as(:teacher)
		# 	visit admin_path
		# 	expect(current_path).to eq(root_path)
		# end

	end

	
	# context "if user is an admin" do
	
	# 	it "allows an admin user to visit the admin page" do 
	# 		create_user_and_login_as(:admin_user)
	# 		click_link 'Admin'
	# 		expect(current_path).to eq(admin_path)
	# 	end

	# 	it "allows a teacher_admin to visit the admin page" do 
	# 		create_user_and_login_as(:teacher_admin_user)
	# 		click_link 'Admin'
	# 		expect(current_path).to eq(admin_path)
	# 	end

	# end

end