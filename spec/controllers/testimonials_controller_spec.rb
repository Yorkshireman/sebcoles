require "rails_helper.rb"

def successful_render_of(template)
	expect(response).to have_http_status(:success)
	expect(response).to render_template(template)
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
			it "creates new testimonial"
				# expect {
				# 	post :create, testimonial: FactoryGirl.attributes_for(:testimonial)
				# 	}.to change(Testimonial, :count).by(1)
			
		end

		context "with INvalid attributes" do
			it "does not create a new testimonial"
			it "re-renders the #new method"
		end
	end

	describe "PUT #update" do
		before :each do
			@testimonial = FactoryGirl.create :testimonial, content: "blah blah blah"
		end

		context "valid attributes" do
			it "locates the requested @testimonial"
			it "changes @testimonial's attributes"
			it "redirects to the home page"
		end	

		context "invalid attributes" do
			it "locates the requested @testimonial"
			it "does not change @testimonial's attributes"
			it "re-renders the edit method"
		end
	end

	describe "DELETE destory" do
		before :each do
			@testimonial = FactoryGirl.create :testimonial
		end

		it "deletes the testimonial"
		it "redirects to home page"

	end

end