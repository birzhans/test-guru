class ApplicationMailer < ActionMailer::Base
  default from: %{"Test-Guru"}
  layout 'mailer'
end
