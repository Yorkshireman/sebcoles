require 'faker'

FactoryGirl.define do
	factory :testimonial do |f|
		f.content { Faker::Lorem.paragraph }
	end

	factory :invalid_testimonial, parent: :testimonial do |f|
		f.content ""
	end
end