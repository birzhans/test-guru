class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :question, optional: true

  before_validation :before_validate_set_first_question, on: :create

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.question = next_question
    save!
  end

  def completed?
    question.nil?
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

  def next_question
    test.questions.order(:id).where('id > ?', question.id).first
  end
end
