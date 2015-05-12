require "rails_helper.rb"

describe MaterialsController do 

	describe "GET #index" do 
		
		it "populates an array of materials" do 
			controller.class.skip_before_action :require_authorisation_to_view_materials
			material = FactoryGirl.create :material
			get :index
			assigns(:materials).should eq([material])
		end

	end

end