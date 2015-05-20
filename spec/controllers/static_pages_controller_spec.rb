require "rails_helper.rb"
require "devise"

describe StaticPagesController do

	describe "GET #home" do
		it "renders the :home view" do
			get :home
			expect(response).to have_http_status(:success)
			expect(response).to render_template :home
		end
	end

	describe "GET #admin" do
		it "renders the :admin view" do
			controller.stub :an_admin?
			get :admin 
			expect(response).to have_http_status(:success)
			expect(response).to be_success
		end

		it "redirects to root_path when no user is passed in" do 
			get :admin
			expect(response).to redirect_to root_path
		end

		#Can't get this to work (probably due to not being able to get the Devise helpers working)
		it "renders :admin template when an admin_user is logged-in"
			# Next line does seem to set current_user to an admin_user, but I still need to simulate a login to satisfy the signed_in? part of the an_admin? method.
			#allow(controller).to receive(:current_user).and_return(FactoryGirl.create(:admin_user))
			#expect(controller).to receive(FactoryGirl.create(:admin_user)).and_return(true)
			# expect(an_admin?).to receive(FactoryGirl.create(:admin_user)).and_return(true)
			# get :admin
			# expect(response).to be_success

	end

end