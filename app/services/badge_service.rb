class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @badges = []
  end

  def call
    Badge.select do |badge|
      @badge = badge
      send("#{badge.rule}")
    end
    @badges
  end

  def all_tests
    all_tests = Test.all.
                where(complete: true).
                select(:id).map {|t| t.id}.
                to_a.sort

    user_passed_tests = @user.test_passages.
                        where(passed: true).
                        select(:test_id).
                        map {|t| t.test_id}.
                        to_a.sort
  @badges << @badge if all_tests.eql?(user_passed_tests)

  end

  def all_by_category
    category = Category.find(@badge.rule_value.to_i)
    tests = Test.where('category_id = ?', category.id)
    tests_ids = tests_ids(tests)
    @badges << @badge if same?(tests_ids)
  end

  def all_by_level
    level = @badge.rule_value.to_i
    tests = Test.where('level = ?', level)
    tests_ids = tests_ids(tests)
    @badges << @badge if same?(tests_ids)
  end

  def first_try
    test_passages = @user.test_passages.where('test_id = ?', @test.id)
    if test_passages.count.eql?(1) && test_passages[0].passed
      @badges << @badge
    end
  end

  def same?(tests)
    tests - passed_tests == []
  end

  def tests_ids(tests)
    tests.map { |t| t.id }.
         to_a.
         uniq.
         sort
  end

  def passed_tests
    @user.test_passages.
    where(passed: true).
    select(:test_id).
    map {|t| t.test_id}.
    to_a.uniq.sort
  end
end
