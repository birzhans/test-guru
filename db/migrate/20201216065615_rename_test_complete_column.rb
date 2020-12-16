class RenameTestCompleteColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :tests, :published, :complete
    rename_column :tests, :complete, :published
  end
end
