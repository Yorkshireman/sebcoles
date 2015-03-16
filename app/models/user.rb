class User < ActiveRecord::Base
	groupify :group_member
	groupify :named_group_member
end

class Assignment < ActiveRecord::Base
  groupify :group_member
end
