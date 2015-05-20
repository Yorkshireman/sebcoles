require "rails_helper.rb"

def try_to_render_admin_template_using(user_type)
	user = FactoryGirl.create(user_type)
	allow(controller).to receive(:signed_in?).and_return(true)
	allow(controller).to receive(:current_user).and_return(user)
	get :admin
end

def successful_render_of(template)
	expect(response).to have_http_status(:success)
	expect(response).to render_template(template)
end


describe StaticPagesController do

	describe "GET #home" do
		it "renders the :home view" do
			get :home
			successful_render_of(:home)
		end
	end


	describe "GET #admin" do

		it "renders the :admin view" do
			#controller.stub :an_admin? (old syntax, but easier to understand than the next line!)
			allow(controller).to receive(:an_admin?).and_return(true)
			get :admin 
			successful_render_of(:admin)
		end


		context "When user is not signed-in" do 
			
			it "redirects to root_path" do 
				get :admin
				expect(response).to redirect_to(root_path)
			end

		end

		context "When user is a signed-in non-admin" do 

			it "redirects to root_path" do
				try_to_render_admin_template_using(:unassigned_user)
				expect(response).to redirect_to(root_path)

				try_to_render_admin_template_using(:student)
				expect(response).to redirect_to(root_path)
			end

		end

		context "When user is a signed-in admin" do 

			it "renders admin template with signed-in admin" do
				try_to_render_admin_template_using(:admin_user)
				successful_render_of(:admin)

				try_to_render_admin_template_using(:teacher_admin_user)
				successful_render_of(:admin)
			end

		end

	end

end