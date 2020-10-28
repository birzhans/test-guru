class QuestionForTestPassage < ActiveRecord::Migration[6.0]
  def change
    remove_reference :test_passages, :current_question
    add_reference :test_passages, :question
  end
end
