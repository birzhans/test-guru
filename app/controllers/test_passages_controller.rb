class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show result update gist]

  def show
    if @test_passage.test.questions.blank?
      redirect_to root_path, alert: t('.invalid_questions')
    end

    if @test_passage.current_question.answers.blank?
      redirect_to root_path, alert: t('.invalid_answers')
    end
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      @test_passage.update(passed: true)
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
      awarding
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    result.call
    if result.success?
      current_user.gists.create(question_id: @test_passage.current_question.id, url: result.url)
      redirect_to @test_passage, notice: t('.success', url: result.url)
    else
      redirect_to @test_passage, alert: t('.failure')
    end

  end

  private

  def awarding
    badges = BadgeService.new(@test_passage).call

    if badges.any?
      badges.each do |badge|
        badge.users << @test_passage.user
      end
      flash["notice"] = t('.new_badges')
    end
  end

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
