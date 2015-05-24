require "rails_helper.rb"

def successful_render_of(template)
	expect(response).to have_http_status(:success)
	expect(response).to render_template(template)
end

def log_in(user_type)
	sign_in FactoryGirl.create(user_type)
end

describe TestimonialsController do 

	describe "GET #index" do
		it "populates an array of testimonials (@testimonials)" do 
			testimonial1, testimonial2 = (FactoryGirl.create :testimonial), (FactoryGirl.create :testimonial)
			get :index
			expect(assigns(:testimonials)).to eq([testimonial1, testimonial2])
		end

		it "renders the :index view" do 
			get :index
			successful_render_of(:index)
		end
	end

	describe "GET #show" do 
		it "assigns the requested testimonial to @testimonial" do 
			testimonial = FactoryGirl.create :testimonial
			get :show, id: testimonial
			expect(assigns(:testimonial)).to eq(testimonial)
		end

		it "renders the #show view" do 
			get :show, id: FactoryGirl.create(:testimonial)
			expect(response).to render_template :show
		end
	end

	describe "POST #create" do 
		context "with VALID attributes" do 
			it "creates new testimonial" do
				log_in(:student)
				expect {
						post :create, testimonial: FactoryGirl.attributes_for(:testimonial)
				}.to 	change(Testimonial, :count).by(1)
			end
		end

		context "with INvalid attributes" do
			it "does not create a new testimonial" do 
				log_in(:student)
				expect {
					post :create, testimonial: FactoryGirl.attributes_for(:invalid_testimonial)
				}.to 	change(Testimonial, :count).by(0)
			end

			it "re-renders the #new method" do 
				log_in(:student)
				post :create, testimonial: FactoryGirl.attributes_for(:invalid_testimonial)
				expect(response).to render_template(:new)
			end
		end
	end

	describe "PUT #update" do
		before :each do
			@testimonial = FactoryGirl.create :testimonial, content: "blah blah blah"
		end

		context "valid attributes" do

			it "locates the requested @testimonial" do 
				put :update, id: @testimonial, testimonial: FactoryGirl.attributes_for(:testimonial)
				expect(assigns :testimonial).to eq @testimonial				
			end

			it "changes @testimonial's attributes" do 
				put :update, id: @testimonial,
					testimonial: FactoryGirl.attributes_for(:testimonial, content: "edited blah")
				@testimonial.reload
				expect(@testimonial.content).to eq("edited blah")
			end

			it "redirects to the home page" do 
				put :update, id: @testimonial, testimonial: FactoryGirl.attributes_for(:testimonial)
				expect(response).to redirect_to root_path
			end
		end	

		context "invalid attributes" do
			it "locates the requested @testimonial" do 
				put :update, id: @testimonial, testimonial: FactoryGirl.attributes_for(:testimonial)
				expect(assigns :testimonial).to eq @testimonial				
			end

			it "does not change @testimonial's attributes" do 
				put :update, id: @testimonial,
					testimonial: FactoryGirl.attributes_for(:testimonial, content: "")
				@testimonial.reload
				expect(@testimonial.content).to_not eq("")				
			end

			it "re-renders the edit method" do 
				put :update, id: @testimonial, testimonial: FactoryGirl.attributes_for(:invalid_testimonial)
				expect(response).to render_template :edit
			end
		end
	end

	describe "DELETE destroy" do
		before :each do
			@testimonial = FactoryGirl.create :testimonial
		end

		it "deletes the testimonial" do
			allow(controller).to receive(:can_delete_testimonial?).and_return(true)
			expect{
				delete :destroy, id: @testimonial
			}.to change(Testimonial, :count).by(-1)
		end

		it "redirects to home page" do 
			delete :destroy, id: @testimonial
			expect(response).to redirect_to root_path
		end

		it "allows deletion of any testimonial by an admin user" do
			def destroy_testimonial(user_type)
				log_in(user_type)
				expect{
							delete :destroy, id: @testimonial
				}.to 	change(Testimonial, :count).by(-1)
				sign_out(:user)
			end

			destroy_testimonial(:admin_user)

			@testimonial = FactoryGirl.create :testimonial
			
			destroy_testimonial(:teacher_admin_user)
		end
	end
end