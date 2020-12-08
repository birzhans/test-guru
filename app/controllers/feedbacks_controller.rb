class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(params.require(:feedback).permit(:message))

    if @feedback.save
      FeedbackMailer.send_feedback(@feedback)
      redirect_to root_path, notice: t('.success')
    else
      render :new, notice: t('.failure')
    end
  end
end
