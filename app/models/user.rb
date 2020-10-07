class User < ApplicationRecord
  def tests_by_level(level)
    user_tests = []
    UserTest.where(user_id: self.id).to_a.each do |test|
      if test.level.eql?(level)
        user_tests << test
      end
end
