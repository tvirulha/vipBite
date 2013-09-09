module SessionsHelper

	def sign_in(user)
		#token = BCrypt::Password.create(user);
		cookies.permanent[:user_Id] = user;
		self.current_user = user;
	end

	def check_cookies
		if(cookies[:user_Id])
			retrieveuser = Users.find_by_user_email(cookies[:user_Id]);
			@current_user = retrieveuser.user_email;
		else
			return nil;
		end
	end

	def current_user=(user)
		@current_user = user;
	end

	def sign_out
		self.current_user = nil;
		cookies.delete(:user_Id);
	end
end
