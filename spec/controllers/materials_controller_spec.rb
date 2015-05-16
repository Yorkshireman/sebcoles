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

	describe "PUT #update" do 
		before :each do 
			@material = FactoryGirl.create :material, title: "Title", level: "B2", description: "blah blah", link: "Dropbox Link"
		end

		context "valid attributes" do 
			it "locates the requested @material" do 
				put :update, id: @material, material: FactoryGirl.attributes_for(:material)
				expect(assigns :material).to eq @material
			end

			it "changes @material's attributes" do 
				put :update, id: @material,
					material: FactoryGirl.attributes_for(:material, title: "Title", level: "A1", description: "blah blah", link: "Dropbox Link")
				@material.reload
				expect(@material.title).to 				eq("Title")
				expect(@material.level).to 				eq("A1")
				expect(@material.description).to 	eq("blah blah")
			end

			it "redirects to the materials page" do 
				put :update, id: @material, material: FactoryGirl.attributes_for(:material)
				expect(response).to redirect_to :materials
			end
		end

		context "invalid attributes" do 
			it "locates the requested @material" do 
				put :update, id: @material, material: FactoryGirl.attributes_for(:invalid_material)
				expect(assigns :material).to eq @material
			end

			it "does not change @material's attributes" do 
				put :update, id: @material,
					material: FactoryGirl.attributes_for(:material, title: nil, level: "B1", description: "description", link: "Dropbox Link")
				@material.reload
				expect(@material.title).to 				eq("Title")
				expect(@material.level).to_not 		eq("B1")
				expect(@material.description).to 	eq("blah blah")
			end

			it "re-renders the edit method" do 
				put :update, id: @material, material: FactoryGirl.attributes_for(:invalid_material)
				expect(response).to render_template :edit
			end
		end
	end

	describe "DELETE destroy" do 
		before :each do 
			@material = FactoryGirl.create :material
		end

		it "deletes the material" do 
			expect{
				delete :destroy, id: @material
			}.to change(Material, :count).by(-1)
		end

		it "redirects to materials#index" do 
			delete :destroy, id: @material
			expect(response).to redirect_to :materials
		end
	end
end