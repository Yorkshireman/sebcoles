class Testimonial < ActiveRecord::Base
	belongs_to :student

	validates :content, presence: :true

end
