module StaticPagesHelper

	def allowed_to_see_admin_link?
		signed_in? && current_user.admin
	end

end
