require 'faker'

FactoryGirl.define do
	factory :user do |f|
		f.first_name 	{ Faker::Name.first_name }
		f.last_name 	{ Faker::Name.last_name }
		f.email 		{ Faker::Internet.email }
		f.password 		{ Faker::Internet.password(8) }

		trait :student do
			type "Student"
		end

		trait :teacher do 
			type "Teacher"
		end

		trait :admin do 
			admin true
		end

		factory :unassigned_user		# Don't need to state false admin because it's default in the model.
		factory :admin_user, 			traits: [:admin]
		factory :student,				traits: [:student]
		factory :teacher,				traits: [:teacher]
		factory :teacher_admin_user,	traits: [:teacher, :admin]

	end
end