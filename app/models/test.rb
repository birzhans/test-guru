class Test < ApplicationRecord
  def self.by_category(category_name)
     joins("JOIN categories ON tests.category_id = categories.id")
       .where("categories.title = ?", category_name)
       .order(title: :desc)
       .pluck(:id)
  end

  belongs_to :category

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users
end
