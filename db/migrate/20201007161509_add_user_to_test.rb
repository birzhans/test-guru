class AddUserToTest < ActiveRecord::Migration[6.0]
  def change
    add_reference(:users, :test, null: false, foreign_key: true)
  end
end
