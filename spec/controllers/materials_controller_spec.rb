require "rails_helper.rb"

describe MaterialsController do 

	describe "GET #index" do 
		it "populates an array of materials" do 
			controller.class.skip_before_action :require_authorisation_to_view_materials
			material = FactoryGirl.create :material
			get :index
			expect(assigns(:materials)).to eq([material])
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

end