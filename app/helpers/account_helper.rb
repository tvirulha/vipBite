module AccountHelper
	def sign_in(user)
		cookies.permanent.singed[:user_id] = user;
	end

	def sign_out
		cookies.delete(:user_id);
	end
end
