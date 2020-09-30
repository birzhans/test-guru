class TestDefaultNullFkey < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)
    change_column_default(:tests, :level, from: nil, to: 0)
    add_reference(:tests, :category, null: false, foreign_key: true)
  end
end
