class RenameBadgeColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :badges, :file_name, :octicon
  end
end
