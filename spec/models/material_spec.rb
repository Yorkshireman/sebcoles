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

	it "is valid without a description" do
		expect(FactoryGirl.create(:material, description: nil)).to be_valid
	end

	it "is invalid without a link" do
		expect(FactoryGirl.build(:material, link: nil)).to_not be_valid
	end

	it "is unique"

end