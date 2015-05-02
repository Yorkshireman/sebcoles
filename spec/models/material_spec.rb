require 'rails_helper.rb'

describe Material do 

	it "has a valid factory" do
		expect(FactoryGirl.create(:material)).to be_valid
	end

	it "is invalid without a title" do
		expect(FactoryGirl.build(:material, title: nil)).to_not be_valid
	end

	it "is invalid without a level" do
		expect(FactoryGirl.build(:material, level: nil)).to_not be_valid
	end

	it "has a level which is A1, A2, B1, B2, C1, C2, or All"
	# In model can use validates :material, inclusion: ["A1", "A2" etc]
	# May not need this text, so long as form selects are always properly implemented.

	it "is valid without a description" do
		expect(FactoryGirl.create(:material, description: nil)).to be_valid
	end

	it "is invalid without a link" do
		expect(FactoryGirl.build(:material, link: nil)).to_not be_valid
	end

	it "is unique"

end