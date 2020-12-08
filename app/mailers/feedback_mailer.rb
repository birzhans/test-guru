class FeedbackMailer < ApplicationMailer
  def send_feedback(feedback)
    @feedback = feedback
    mail to: Admin.first.email
  end
end
