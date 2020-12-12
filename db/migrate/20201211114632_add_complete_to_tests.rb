class AddCompleteToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :complete, :boolean
  end
end
