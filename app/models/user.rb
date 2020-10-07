class User < ApplicationRecord
  def tests_by_level(level)
    Test.where(user_id: self.id, level: level)
  end
end
