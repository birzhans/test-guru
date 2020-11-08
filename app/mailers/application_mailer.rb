class ApplicationMailer < ActionMailer::Base
  default from: %{"Test-Guru <mail@testguru.com>}
  layout 'mailer'
end
