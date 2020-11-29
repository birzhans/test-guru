class ChangeQuestionForeignKeyOnDelete < ActiveRecord::Migration[6.0]
  def change
    change_column :questions, :test_id, :integer, on_delete: :cascade
  end
end
