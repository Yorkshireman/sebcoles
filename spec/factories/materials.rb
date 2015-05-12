require 'faker'

FactoryGirl.define do
	factory :material do |f|
		f.title { Faker::Name.title }
		f.level { Faker::Lorem.characters(3) }
		f.description { Faker::Lorem.paragraph }
		f.link { Faker::Internet.url }
	end

	factory :invalid_material, parent: :material do |f|
		f.title nil
	end
end