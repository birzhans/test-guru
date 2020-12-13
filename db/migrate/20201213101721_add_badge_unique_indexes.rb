class AddBadgeUniqueIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :badges, [:octicon, :color], unique: true
    add_index :badges, [:rule_id, :rule_value], unique: true
  end
end
