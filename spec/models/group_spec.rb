require 'rails_helper'

describe Group do
	it "has a valid factory" do
		expect(FactoryGirl.create(:group)).to be_valid
	end
end