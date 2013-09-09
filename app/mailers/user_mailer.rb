class UserMailer < ActionMailer::Base
  default from: "vipBite@gmail.com"

  def passwordrequest(user, newpwd)
    @greeting = "Hi";
    @user = user;
    @newpwd = newpwd;
    mail to: "tamanon.v@gmail.com", subject: "Password for you vipBite Account"
  end
end
