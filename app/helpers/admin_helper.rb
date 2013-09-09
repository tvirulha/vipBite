module AdminHelper

	def IsAdminUser(user_Id)
		retrieveAdminUser = Users.find_by_user_email(user_Id);

		if(retrieveAdminUser.user_type == "Admin")
			return true;
		else
			return false;
		end
	end
end
