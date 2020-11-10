class Test < ApplicationRecord
  belongs_to :category

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


  def self.tests_by_category(category_name)
    by_category(category_name)
    .where(categories: { title: category_name })
    .order(title: :desc)
    .pluck(:title)
  end

  def author
    author = Admin.find_by(id: self.author_id)
    "#{author.first_name} #{author.last_name}"
  end
end
