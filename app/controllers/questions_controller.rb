class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[index create new]

  def index
    render plain: @test.questions
  end

  def show
    render plain: @question.body
  end

  def create
    question = @test.questions.new(question_params)

    if question.valid?
      question.save
      render plain: question.inspect
    else
      render plain: question.errors.messages
    end
  end

  def destroy
    @question.destroy
  end

  def new
    @question = @test.questions.new
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
