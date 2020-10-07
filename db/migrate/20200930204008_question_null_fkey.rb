class QuestionNullFkey < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:questions, :body, false)
    add_reference(:questions, :test, null: false, foreign_key: true)
  end
end
