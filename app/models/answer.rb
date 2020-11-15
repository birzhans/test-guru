class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_number_of_answers, on: :create

  scope :correct, -> { where(correct: true) }

  def correct_s
    self.correct ? I18n.t('helpers.yeap') : I18n.t('helpers.nope')
  end

  private

  def validate_number_of_answers
    error.add(:question) if question.answers.count > 4
  end
end
