class AddNotNullConstraintsToBadge < ActiveRecord::Migration[6.0]
  def change
    change_column_null :badges, :title, false
    change_column_null :badges, :octicon, false
  end
end
