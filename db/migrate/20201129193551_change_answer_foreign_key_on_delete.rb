class ChangeAnswerForeignKeyOnDelete < ActiveRecord::Migration[6.0]
  def change
    change_column :answers, :question_id, :integer, on_delete: :cascade
  end
end
