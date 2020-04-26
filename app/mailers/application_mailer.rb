class ApplicationMailer < ActionMailer::Base
  default from: "info@#{ENV['SMTP_DOMAIN']}"
  layout 'mailer'
end
