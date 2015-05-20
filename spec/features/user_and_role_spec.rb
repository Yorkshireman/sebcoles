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

	def create_and_login_user_as_a(type)
		user = FactoryGirl.create(type)
		visit(new_user_session_path)
		fill_in('user_email', :with => user.email)
		fill_in('user_password', :with => user.password)
		click_button('Log in')
	end


describe 'User roles' do 	

	it "Login/Logout works" do
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

	context "When not logged-in" do
		it "User cannot visit the admin page" do
			visit(admin_path)
			expect(current_path).to eq(root_path)
		end

		it "Admin link is not visible in header on root_path page" do
			visit(root_path)
			expect(page).to_not have_link('Admin')
		end
	end

	context "When logged-in but not an admin" do

		it "Admin link is not visible in header on root_path page" do 
			visit(root_path)
			expect(page).to_not have_link('Admin')
			create_and_login_user_as_a(:unassigned_user)
			expect(page).to_not have_link('Admin')
			click_link("Logout")
			create_and_login_user_as_a(:student)
			expect(page).to_not have_link('Admin')
			click_link("Logout")
			create_and_login_user_as_a(:teacher)
			expect(page).to_not have_link('Admin')
			click_link("Logout")
		end

		it "User is redirected to root_path when trying to access admin page" do
			create_and_login_user_as_a(:unassigned_user)
			visit(admin_path)
			expect(current_path).to eq(root_path)
			click_link("Logout")
			create_and_login_user_as_a(:student)
			visit(admin_path)
			expect(current_path).to eq(root_path)
			click_link("Logout")
			create_and_login_user_as_a(:teacher)
			visit(admin_path)
			expect(current_path).to eq(root_path)
			click_link("Logout")
		end

	end

end