class UniqueIndexToUsersTests < ActiveRecord::Migration[6.0]
  def change
    remove_index :tests_users, name: "index_tests_users_on_test_id_and_user_id"
    add_index :tests_users, ["test_id", "user_id"], unique: true
  end
end
