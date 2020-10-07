class Test < ApplicationRecord
  def self.by_category(category)
    category_id = Category.where(title: category).limit(1).id
    self.where(category_id: category_id).order(title: :desc)
  end
end
