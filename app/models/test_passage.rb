class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validate_set_current_question

  POINTS_TO_COMPLETE = 85

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def completed?
    current_question.nil? || expired?
  end

  def score
    correct_questions * 100 / test.questions.count
  end

  def time_passed
    Time.now - created_at
  end

  def time_left
    (test.duration * 60 - time_passed).to_i
  end

  def failed?
    score < POINTS_TO_COMPLETE || expired?
  end

  def expired?
    time_left < 0
  end

  def question_index
    test.questions.index(current_question) + 1
  end

  private

  def remaining
    if self.current_question.nil?
      test.questions.order(:id)
    else
      test.questions.order(:id).where('id > ?', current_question.id)
    end
  end

  def before_validate_set_current_question
    self.current_question = remaining.first
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    self.current_question.answers.correct
  end
end
