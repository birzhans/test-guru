class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :question, optional: true

  before_validation :before_validate_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  POINTS_TO_COMPLETE = 85

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def completed?
    self.question.nil?
  end

  def score
    correct_questions * 100 / test.questions.count
  end

  def passed?
    score >= POINTS_TO_COMPLETE
  end

  def question_index
    test.questions.index(question) + 1
  end

  private

  def before_validate_set_first_question
    self.question = test.questions.first
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    self.question.answers.correct
  end

  def before_validation_set_next_question
    self.question = test.questions.order(:id).where('id > ?', self.question.id).first
  end
end
