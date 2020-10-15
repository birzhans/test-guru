class Test < ApplicationRecord
  belongs_to :category

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  scope :by_category, -> (category_name) do
     joins(:category)
       .where("categories.title = ?", category_name)
       .order(title: :desc)
       .pluck(:id)
  end

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :advanced, -> { where(level: 5..Float::INFINITY) }

end
