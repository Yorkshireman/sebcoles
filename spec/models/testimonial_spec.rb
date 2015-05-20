require 'rails_helper'

describe Testimonial do	

	it "has a valid factory" do
		expect(FactoryGirl.create(:testimonial)).to be_valid
	end

	it "is invalid without content" do
		expect(FactoryGirl.build(:testimonial, content: nil)).to_not be_valid
	end

end