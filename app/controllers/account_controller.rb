class AccountController < ApplicationController
	require 'active_merchant';
	
	def vipBite_LogOut
	end

	def vipBite_Register
		@title = 'Become a Member';

		if(request.get?)
			flash[:warning] = nil;
			return;
		end

		if(request.post?)
			if ((!params[:firstName].empty?) && (!params[:lastName].empty?) && (!params[:email].empty?) \
			&& (!params[:password].empty?) && (!params[:cfm_password].empty?))
				
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
			else
				flash[:warning] = "Not all field are populate!";
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
end
