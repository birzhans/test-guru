class AnswerFkeyNullCons < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:answers, :body, false)
    add_column(:answers, :correct, :boolean, default: false)
    add_reference(:answers, :question, null: false, foreign_key: true)
  end
end
