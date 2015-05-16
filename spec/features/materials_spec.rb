require 'rails_helper'

describe 'Materials' do 
	describe 'Manage Materials' do 
		it "Adds a new material and displays the results" do
			
			visit materials_path
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