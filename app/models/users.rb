class Users < ActiveRecord::Base
	require 'bcrypt';
	require 'Date';
	require 'securerandom';
	require 'active_merchant';

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

	def self.addNewClient(firstname, lastname, email, password, confirmation_pwd)
		if(password.to_s == confirmation_pwd.to_s)
			encryptpwd = BCrypt::Password.create(password);

			self.create(:user_firstName => firstname,
	             :user_lastName => lastname,
	             :user_email => email,
	             :user_type => 'Client',
	             :user_password => encryptpwd,
	             :userExpirationDate => Date.today.to_s);

			return true;
		else
			return false;
		end
	end

	def self.makePurchase(firstName, lastName, cardno, cardtype, expiration, cvv, price, ipaddress, address, city, province, postal)

		creditCrad = ActiveMerchant::Billing::CreditCard.new(
			:type => cardtype,
			:number => cardno,
			:first_name => firstName,
			:last_name => lastName,
			:month => 12,
			:year => 2025,
			:verification_value => cvv
			)

		cd_billingAddress = billingAddress(firstName, lastName, address, city, province, postal);

		if (creditCrad.valid?)
			response = GATEWAY.purchase(price, creditCrad, :ip => ipaddress, :billing_address => cd_billingAddress);
			return {:complete => response.success?, :message=>response.message};
		else
			return nil;
		end
		
	end

	def self.billingAddress(firstname, lastname, address, city, province, postal)
		{   
			:name => firstname + lastname,
			:address1 => address,
			:city => city,
			:state => province,
			:country => "CA",
			:zip => postal
		}
	end
end
