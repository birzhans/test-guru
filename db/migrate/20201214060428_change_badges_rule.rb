class ChangeBadgesRule < ActiveRecord::Migration[6.0]
  def change
    rename_column :badges, :rule_id, :rule
    change_column :badges, :rule, :string
  end
end
