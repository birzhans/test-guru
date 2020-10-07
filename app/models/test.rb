class Test < ApplicationRecord
  def self.by_category(category_name)
     #category_id = Category.where(title: category).limit(1).id
     #self.where(category_id: category_id).order(title: :desc)
     #Category.where("id = 1")
     joins("JOIN categories ON tests.category_id = categories.id")
       .where("categories.title = ?", category_name)
       .order(title: :desc)
       .pluck(:id)
  end
end
