class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :admin, inclusion: { in: [true, false] }

  def full_name
  	"#{first_name} #{last_name}"
  end

  def can_view_materials?
    admin || type == "Teacher" || type == "Student" && groups.any? # So only current students can view the Materials page.
  end

end
