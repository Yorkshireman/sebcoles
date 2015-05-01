require 'rails_helper'

describe User do

	it "has a valid factory" do
		expect(FactoryGirl.create(:user)).to be_valid
	end

	it "is invalid without an email" do
		expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
	end
	
	it "is invalid without a first_name" do
		expect(FactoryGirl.build(:user, first_name: nil)).to_not be_valid
	end
	
	it "is invalid without a last_name" do
		expect(FactoryGirl.build(:user, last_name: nil)).to_not be_valid
	end

	it "is invalid without a value for admin" do
		expect(FactoryGirl.build(:user, admin: nil)).to_not be_valid
	end
	
	it "returns a user's full name as a string" do
		user = FactoryGirl.create(:user, first_name: "John", last_name: "Smith")
		expect(user.full_name).to eq "John Smith"
	end

end