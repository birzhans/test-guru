class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show result update gist]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    result.call
    url = result.url
    if url
      current_user.gists.create(question_id: @test_passage.current_question.id, url: url)
      redirect_to @test_passage, notice: t('.success', url: url)
    else
      redirect_to @test_passage, alert: t('.failure')
    end

  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
