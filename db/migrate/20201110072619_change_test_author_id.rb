class ChangeTestAuthorId < ActiveRecord::Migration[6.0]
  def change
    change_column_default :tests, :author_id, Admin.first.id
  end
end
