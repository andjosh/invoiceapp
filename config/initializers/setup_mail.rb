ActionMailer::Base.smtp_settings = {
  :authentication => :plain,
  :address => "smtp.mailgun.org",
  :port => 587,
  :domain => "roninvoice.mailgun.org",
  :user_name => "postmaster@roninvoice.mailgun.org",
  :password => "33ynlxssa8w6"
}