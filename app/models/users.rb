class Users < ActiveRecord::Base
	require 'bcrypt';
	require 'securerandom';

	attr_accessible :user_firstName, :user_lastName, :user_email, :user_password, :userExpirationDate, :user_type

	def self.authenticate(email, input_pwd)
		user = find_by_user_email(email);

		checkpwd = BCrypt::Password.new(user.user_password);

		if(user != nil and checkpwd == input_pwd)
			return user.user_email;
		else
			return user.user_email;
		end
	end

	def self.resetpwd(email)
		user = find_by_user_email(email);

		new_pwd = SecureRandom.uuid;
		encryptpwd = BCrypt::Password.create(new_pwd);

		user.user_password = encryptpwd;

		return new_pwd;
	end
end
