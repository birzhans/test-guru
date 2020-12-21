class AddTestDuration < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :duration, :integer, default: 10
  end
end
