class HomeController < ApplicationController
	def vipBite_Index
		@title = 'Home';
	end

	def vipBite_HowItWor
		@title = 'How it Wrok';
	end

	def vipBite_ContactUs
		if (request.post?)
			user = Users.find_by_user_email(cookies[:user_Id]);

			if(user != nil)
				UserMailer.supportemail(user, params[:emailContent]).deliver
				redirect_to(root_url);
			end
		elsif (request.get?)
			return
		end
	end
end
