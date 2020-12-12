class FeedbackMailer < ApplicationMailer
  def send_feedback(feedback)
    @feedback = feedback
    mail to: Admin.first.email, subject: t('.subject')
  end
end
