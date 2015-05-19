require "rails_helper.rb"

describe StaticPagesController do
	
	describe "GET #home" do
		it "renders the :home view" do
			get :home
			expect(response).to render_template :home
		end
	end

	describe "GET #admin" do
		it "renders the :admin view" do
			get :admin 
			expect(response).to render_template :admin
		end

		it "requires user to be signed_in"

		it "requires user to be an admin"
	end

end