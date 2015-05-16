require 'faker'

FactoryGirl.define do
	factory :user do |f|
		f.first_name 	{ Faker::Name.first_name }
		f.last_name 	{ Faker::Name.last_name }
		f.email 		{ Faker::Internet.email }
		f.password 		{ Faker::Internet.password(8) }
		f.admin 		true

		factory :student do
			type "Student"
		end

		factory :teacher do 
			type "Teacher"
		end

		trait :admin do 
			admin true
		end

		factory :admin_user, traits: [:admin]  

	end
end