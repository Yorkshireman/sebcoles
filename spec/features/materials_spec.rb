require 'rails_helper'

def create_user_and_login_as(type)
	user = FactoryGirl.create(type)
	visit(new_user_session_path)
	fill_in('user_email', :with => user.email)
	fill_in('user_password', :with => user.password)
	click_button('Log in')
end

describe 'Materials' do 

	describe 'Manage Materials' do 
		it "Adds a new material and displays the results" do
			create_user_and_login_as(:admin_user)
			visit materials_path
			expect(current_path).to eq(materials_path)
			expect{
				click_on('Add Material')
				fill_in 'Title', with: "Awesome Material"
				select "A1", :from => "material_level"
				fill_in 'Description', with: "This material is awesome; download it now."
				fill_in 'Link', with: "Dropbox Link"
				click_button "Create Material"
			}.to change(Material, :count).by(1)
		end
	end

end