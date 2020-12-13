class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  OCTICONS = ["file-code", "flame", "heart", "mortar-board", "pulse", "rocket", "ruby"]
  COLORS = ["black", "white", "red", "blue", "green", "pink"]

  enum color: { green: 0, blue: 1, red: 2 }
  enum rule_id: { on_the_first_try: 0, all_by_category: 1, all_by_level: 2, overall: 3 }

  validates :title, presence: true, uniqueness: true
  validates :octicon, uniqueness: { scope: :color, message: t("badge.view_uniqueness") }
  validates :rule_id, uniqueness: { scope: :rule_value, message: t("badge.rule_uniqueness") }
end
