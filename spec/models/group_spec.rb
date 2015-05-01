require 'rails_helper'

describe Group do
	it "has a valid factory" do
		expect(FactoryGirl.create(:group)).to be_valid
	end

	it "is invalid without a title" do
		expect(FactoryGirl.build(:group, title: nil)).to_not be_valid
	end

	it "is invalid with a title longer than 60 characters"

end