class Material < ActiveRecord::Base

	validates :title, presence: :true
	validates :level, presence: :true
	validates :link, presence: :true

end
