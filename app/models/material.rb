class Material < ActiveRecord::Base

	validates :title, presence: :true
	validates :level, presence: :true
	validates :link, presence: :true

	scope :level, -> (x) { where("level == ?", x) }

end
