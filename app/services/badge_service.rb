class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @new_badges = 0
  end

  def call
    Badge.select do |badge|
      if badge.honored?(@test_passage)
        @test_passage.user.badges << badge
        @new_badges += 1
      end
    end
    @new_badges
  end

  def honored?(test_passage)
    send("check_#{rule}", test_passage)
  end

  def check_all_by_category(test_passage)
    tests_by_category = Test.joins(:categories).where("categories.id = ?",  test_passage.test.category.id)

    user_tests_by_category = test_passage.user.completed_tests.joins(:categories).where("categories.id = ?",  test_passage.test.category.id)

    tests_by_category.count == user_tests_by_category.count
  end

  def check_all_tests(test_passage)
    test_passage.user.completed_tests.uniq.count == Test.all.count
  end

  def check_first_try(test_passage)
    TestPassage.where('test_id = ? AND user_id = ?', test_passage.test_id, test_passage.user_id).count == 1
  end

  def check_all_by_level(test_passage)
    level_tests = Test.where('level = ?', level)
    user_level_tests = test_passage.user.completed_tests.where('level = ?', level)

    level_tests.count == user_level_tests.count
  end

end
