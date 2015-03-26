class Group < ActiveRecord::Base
	belongs_to :teacher
	has_and_belongs_to_many :students, join_table: "groups_students"
end
