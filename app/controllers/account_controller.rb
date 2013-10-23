class AccountController < ApplicationController
	require 'active_merchant';
	
	def vipBite_LogOut
	end

	def renewExistingAccount(params)
		if(Users.find_by_user_email(params[:email]) == nil)
			flash[:warning] = "No User find!";
			return;
		end

		succed = Users.makePurchase(params[:noc_firstname], params[:noc_lastname], params[:cardno], params[:cardtype], \
			params[:exp_month], params[:exp_year], params[:cvv], 90, request.remote_ip, params[:address], params[:city], \
			params[:prov], params[:postal]);

		if (succed != nil && succed[:complete] == true)
			Users.update_userExpirationDate(params[:email], params[:membertype]);
			redirect_to(root_url);
		elsif succed.nil?
			flash[:warning] = "FAILURE TO VALIDATE YOUR CREDIT CARD! PLEASE TRY AGAIN";
			Users.deleteIncompleteUserRegistration(params[:email]);
		else
			flash[:warning] = succed[:message];
		end
	end

	def registerNewAccount(params)
		if(Users.find_by_user_email(params[:email]) != nil)
			flash[:warning] = "Email Already Exist";
			return;
		end

		if(params[:cfm_password].to_s != params[:password].to_s)
			flash[:warning] = "Password do not Match";
			return;
		end

		if(Users.addNewClient(params[:firstName], params[:lastName], params[:email], params[:password], params[:cfm_password]))
			if((!params[:noc_lastname].empty?) && (!params[:noc_firstname].empty?) && (!params[:cardno].empty?) \
				&& (!params[:exp_month].empty?) && (!params[:exp_month].empty?) && (!params[:cvv].empty?) \
				&& (!params[:address].empty?) && (!params[:city].empty?) && (!params[:prov].empty?) && (!params[:postal].empty?))

				succed = Users.makePurchase(params[:noc_firstname], params[:noc_lastname], params[:cardno], params[:cardtype], \
					params[:exp_month], params[:exp_year], params[:cvv], 90, request.remote_ip, params[:address], params[:city], \
					params[:prov], params[:postal]);

				if (succed != nil && succed[:complete] == true)
					Users.update_userExpirationDate(params[:email], params[:membertype]);
					redirect_to(root_url);
				elsif succed.nil?
					flash[:warning] = "FAILURE TO VALIDATE YOUR CREDIT CARD! PLEASE TRY AGAIN";
					Users.deleteIncompleteUserRegistration(params[:email]);
				else
					flash[:warning] = succed[:message];
				end
			else
				Users.deleteIncompleteUserRegistration(params[:email]);
				redirect_to(root_url);
			end
		else
			Users.deleteIncompleteUserRegistration(params[:email]);
			redirect_to("/register");
		end
	end

	def vipBite_Register
		@title = 'Become a Member';

		if(request.get?)
			flash[:warning] = nil;
			return;
		end

		if(request.post?)
			if((!params[:firstName].empty?) && (!params[:lastName].empty?) && (!params[:email].empty?))
				if(Users.find_by_user_email(params[:email]) != nil)
					renewExistingAccount(params);
				else
					registerNewAccount(params);
				end
			end
		end
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

	def vipBite_Account
		if(request.post?)
			currentUser = cookies[:user_Id];
			updateEmail = params[:email];
			updatePwd = params[:password];

			Users.updateUserInfo(currentEmail, updateEmail, updatePwd);
		elsif(request.get?)
			logginuser = Users.find_by_user_email(cookies[:user_Id]);

			@loginUserEmail = logginuser.user_email;
			@loginUserExp = logginuser.userExpirationDate;
		end
	end

	def vipBite_RenewMembership
		if(request.get?)
			curr_User = Users.find_by_user_email(cookies[:user_Id]);

			@FirstName = curr_User.user_firstName;
			@LastName = curr_User.user_lastName;
			@Email = curr_User.user_email;
		end
	end
end
