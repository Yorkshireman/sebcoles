require 'faker'

FactoryGirl.define do
	factory :testimonial do |f|
		f.content { Faker::Lorem.paragraph }
	end
end