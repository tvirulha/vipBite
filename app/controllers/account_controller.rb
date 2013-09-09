class AccountController < ApplicationController
	
	def vipBite_LogOut
	end

	def vipBite_Register
		@title = 'Become a Member';
	end

	def vipBite_PwdRecovery
		@title = 'Forget your password?'

		@recover_user = Users.find_by_user_email(params[:email]);

		if (@recover_user != nil)
			newpwd = Users.resetpwd(@recover_user.user_email);

			#send and email to user
			UserMailer.passwordrequest(@recover_user, newpwd).deliver
			redirect_to(root_url);
		end
	end
end
