class UserMailer < ActionMailer::Base
  default from: "vipBite@gmail.com"

  def passwordrequest(user, newpwd)
    @greeting = "Hi";
    @user = user;
    @newpwd = newpwd;
    mail to: "tamanon.v@gmail.com", subject: "Password for you vipBite Account"
  end

  def supportemail(user, content)
  	@user = user;
  	@content = content;
  	subject = "Support Inquirey from" + user.user_firstName + user.user_lastName;
  	mail to: "tamanon.v@gmail.com", subject: subject
  end
end
