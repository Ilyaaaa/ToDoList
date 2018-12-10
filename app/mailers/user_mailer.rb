class UserMailer < ActionMailer::Base
    default :from => "todolisttestuser@gmail.com"

   def registration_confirmation(user)
      @user = user
      mail(:to => "#{user.firstname} <#{user.email}>", :subject => "Registration Confirmation")
   end
end