class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :title, presence: true, uniqueness: true

  validates :octicon, presence: true, uniqueness: { scope: :color }

  validates :rule, presence: true, uniqueness: { scope: :rule_value }

  validate :validate_rule_value

  def self.octicons
    %w(file-code flame heart mortar-board pulse rocket ruby)
  end

  def self.colors
    %w(black white red blue green pink)
  end

  def self.rules
    %w(all_by_category all_tests first_try all_by_level)
  end

  def honored?(test_passage)
    send("check_#{rule}", test_passage)
  end

  private

  def validate_rule_value
    send("validate_#{rule}") if rule != "all_tests"
  end

  def validate_all_by_category
    if Category.all.pluck(:id).exclude?(rule_value.to_i)
      errors.add(:category, "Invalid category id.")
    end
  end

  def validate_first_try
    if Test.all.pluck(:id).exclude?(rule_value.to_i)
      errors.add(:test, "Invalid test id.")
    end
  end

  def validate_all_by_level
    if Test.distinct.pluck(:level).exclude?(rule_value.to_i)
      errors.add(:test, "Invalid test level.")
    end
  end

  def check_all_by_category(test_passage)
    category_id = test_passage.test.category.id
    tests_by_category = Test.where(category_id: category_id)
    user_tests_by_category = test_passage.user.completed_tests.where(category_id: category_id)

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
