class Student < User
	has_and_belongs_to_many :groups, join_table: "groups_students"
end