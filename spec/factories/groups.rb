require 'faker'

FactoryGirl.define do

	factory :group do |f|
		f.title { Faker::Name.title }
	end

end	