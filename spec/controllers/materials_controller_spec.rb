require "rails_helper.rb"

describe MaterialsController do 

	describe "GET #index" do 
		it "populates an array of materials (@materials)" do 
			controller.class.skip_before_action :require_authorisation_to_view_materials
			material1, material2 = (FactoryGirl.create :material), (FactoryGirl.create :material)
			get :index
			expect(assigns(:materials)).to eq([material1, material2])
		end
		# skip_before_action is still skipping it seems, needs to be switched back on manually.
		it "renders the index view" do 
			get :index
			expect(response).to render_template :index
		end	
	end

	describe "GET #show" do 
		it "assigns the requested material to @material" do 
			material = FactoryGirl.create :material
			get :show, id: material
			expect(assigns(:material)).to eq(material)
		end

		it "renders the #show view" do
			get :show, id: FactoryGirl.create(:material)
			expect(response).to render_template :show
		end
	end

	describe "POST #create" do 
		context "with VALID attributes" do
			it "creates new material" do 
				expect {
					post :create, material: FactoryGirl.attributes_for(:material)
				}.to change(Material, :count).by(1)
			end

			it "redirects to the materials page" do
				post :create, material: FactoryGirl.attributes_for(:material)
				expect(response).to redirect_to :materials
			end
		end

		context "with INvalid attributes" do 
			it "does not create new material" do 
				expect {
					post :create, material: FactoryGirl.attributes_for(:invalid_material)
				}.to_not change(Material, :count)
			end

			it "re-renders the #new method" do 
				post :create, material: FactoryGirl.attributes_for(:invalid_material)
				expect(response).to render_template :new
			end
		end
	end
end