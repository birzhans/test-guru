class User < ApplicationRecord
  def tests_by_level(level)
    Test.where(user_id: self.id, level: level)
    Tests.joins("JOIN tests_users ON tests.id = tests_users.id")
    .where(tests_users: {user_id: self.id}, tests: {level: level})
  end

  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users
  has_many :tests_created, class_name:"Test", foreign_key: "author_id",
  dependent: :nullify
end
