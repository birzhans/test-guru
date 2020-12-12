class ChangeBadgeModel < ActiveRecord::Migration[6.0]
  def change
    change_column_null :badges, :user_id, true
    add_column :badges, :color, :string, default: "black"
  end
end
