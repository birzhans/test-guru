class Test < ApplicationRecord
  belongs_to :category

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users
  
  def self.by_category(category_name)
     joins(:category)
       .where("categories.title = ?", category_name)
       .order(title: :desc)
       .pluck(:id)
  end
end
