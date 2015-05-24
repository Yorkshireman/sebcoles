require 'rails_helper'

def create_testimonial(text)
	create_and_login_user_as_a(:student)
	click_on('Deja Tu Opinión')
	fill_in('testimonial_content', :with => text)
	click_on('Create Testimonial')
end

describe 'Testimonials' do

	describe 'Managing Testimonials' do

		it "adds a new testimonial and displays the result" do
			create_testimonial("Random testimonial text")
			expect(page).to have_content('Testimonial was successfully created. Thankyou!')
			expect(page).to have_css('div#testimonials_wrapper')

			within('div#testimonials_wrapper') do
				expect(page).to have_content(@user.full_name)
				expect(page).to have_content("Random testimonial text")
			end
		end

		it "testimonial owner can edit their own testimonial but not someone else's" do 
			#Create first testimonial
			create_testimonial("Student 1 testimonial text")
			click_on("Logout")

			#Create another testimonial as a different user
			create_testimonial("Student 2 testimonial text")

			#Edit 2nd user's testimonial
			click_on("Edit")
			expect(page).to have_content("Student 2 testimonial text")
			fill_in("testimonial_content", with: "Student 2 edited testimonial text")
			click_on("Update")
			expect(current_path).to eq(root_path)
			expect(page).to have_content("Student 2 edited testimonial text")

			#Try to edit the 1st user's testimonial while logged-in as the 2nd user
			visit(root_path)
			visit(edit_testimonial_path(1))
			expect(current_path).to eq(root_path)
			expect(page).to have_content("You can only edit your own testimonial (cheeky!)")
		end

	end

end