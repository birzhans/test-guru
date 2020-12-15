class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @new_badges = []
    @user = @test_passage.user
    @test = @test_passage.test

  end

  def call
    Badge.select do |badge|
      if honored?(badge)
        @test_passage.user.badges << badge
        @new_badges << badge
      end
    end
  end

  def honored?(badge)
    send "check_#{badge.rule}", badge.rule_value
  end

  def check_all_by_category(category_id)
    tests_by_category = Test.where("category_id = ?",  category_id)
    user_tests = Test.passed(@user.id).where("category_id = ?", category_id).uniq

    tests_by_category.count == user_tests.count
  end

  def check_all_tests(rule_value)
    Test.passed(@user.id).uniq.count == Test.all.count
  end

  def check_first_try(test_id)
    TestPassage.where('test_id = ? AND user_id = ?', test_id, @user.id).count == 1
  end

  def check_all_by_level(level)
    level_tests = Test.where('level = ?', level)
    user_level_tests = Test.passed(@user.id).where('level = ?', level).uniq

    level_tests.count == user_level_tests.count
  end

end
