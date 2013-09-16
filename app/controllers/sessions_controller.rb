class SessionsController < ApplicationController
  def new
  end

  def vipBite_LogIn
	if(params[:email].empty? || params[:password].empty?)
		redirect_to(root_url)
	else
		inputEmail = params[:email];
		inputPassword = params[:password];

		@user = Users.authenticate(inputEmail, inputPassword);

		if(@user != nil)
			sign_in(@user);
			redirect_to(root_url, :notice => "Logged in!");
		else
			flash[:error] = 'Invalid email/password combination';
			redirect_to('/register');
		end
	end
  end

  def vipBite_LogOut
  	sign_out
  	redirect_to(root_url, :notice => "Logged out!");
  end
end
