class QuestionsController < ApplicationController
  before_action :admin_required!
  before_action :find_question, only: %i[show destroy edit update]
  before_action :find_test, only: %i[create new]

  def show
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to @question.test
  end


  private

  def admin_required!
    redirect_to root_path, alert: 'You are not authorized to view this page.' unless current_user.is_a?(Admin)
  end

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
