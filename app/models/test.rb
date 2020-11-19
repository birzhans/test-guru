class Test < ApplicationRecord

  LEVELS = {
    0 => :elementary, 1 => :easy, 2 => :medium, 3 => :advanced, 4 => :hard,  5 => :ultimate
  }.freeze

  belongs_to :category, dependent: :destroy
  belongs_to :author, class_name: 'User', optional:true
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages


  validates :title, presence: true, uniqueness: { scope: [:title, :level] }
  validates :level, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10
  }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :advanced, -> { where(level: 5..Float::INFINITY) }


  scope :by_category, -> (category_name) { joins(:category) }

  def level_range
    LEVELS[self.level] || :hero
  end


  def self.tests_by_category(category_name)
    by_category(category_name)
    .where(categories: { title: category_name })
    .order(title: :desc)
    .pluck(:title)
  end
end
