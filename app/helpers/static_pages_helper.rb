module StaticPagesHelper
	
	def any_unassigned_users?
  	array = Array.new
  	users = User.all
  	users.each do |user|
  		if user.type == nil
  			array << user
  		end
  	end
  	array.count > 0
	end

end
