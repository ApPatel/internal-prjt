class UserMailer < ActionMailer::Base
  default from: "hemali.gjain@tcs.com"
   :address => "smtp.gmail.com",
   :port => 587,
   :domain => 'gmail.com',
   :authentication => :plain,
   :user_name=><username>,
   :password=><password>,
   :enable_starttls_auto => true
 end
end
