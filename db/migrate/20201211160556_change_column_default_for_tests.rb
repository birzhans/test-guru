class ChangeColumnDefaultForTests < ActiveRecord::Migration[6.0]
  def change
    change_column_default :tests, :complete, false
  end
end
