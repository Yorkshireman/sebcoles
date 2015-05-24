require 'rails_helper'

describe 'User roles on home page' do 	

	it "Sign up & Logout works" do
		visit(root_path)
		click_link("Sign up")
		fill_in_sign_up_form
		click_button "Sign up"
		expect(current_path).to eq(root_path)
		expect(page).to have_content('Welcome! You have signed up successfully.')
		click_on("Logout")
		expect(current_path).to eq(root_path)
		expect(page).to have_content("Signed out successfully.")
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
			admin_link_not_visible_for( [:unassigned_user, :student, :teacher] )
		end

		it "User is redirected to root_path when trying to access admin page" do
			redirected_to_redirect_path_when_trying_to_access_admin_path_as( [:unassigned_user, :teacher, :student], root_path, :visit )
		end

	end

	context "When a logged-in admin" do
		it "can visit admin page as an Admin" do
			can_visit_admin_page_as([:admin_user, :teacher_admin_user])
		end
	end

end