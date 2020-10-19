class QuestionsController < ApplicationController
  before_action :find_questions, only: %i[index]
  before_action :find_question, only: %i[show]

  def index
    render plain: @questions
  end

  def show
    render plain: @question.body
  end

  def create
    question = Question.create!(question_params)
    render plain: question.inspect
  end

  def destroy
    question = Question.destroy(@question)
    render html: 'question with id <%= @question.id %> was deleted.'
  end

  private

  def find_questions
    @questions = Test.find(params[:test_id]).questions
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    question_params = params.require(:question).permit(:body, :test_id)
    question_params[:test_id] = params[:test_id]
    question_params
  end
end
