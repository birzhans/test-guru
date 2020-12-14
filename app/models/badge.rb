class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  enum rule_id: { on_the_first_try: 0, all_by_category: 1, all_by_level: 2, overall: 3 }

  validates :title,
            presence: true,
            uniqueness: true

  validates :octicon,
            presence: true,
            uniqueness: { scope: :color }

  validates :rule_id,
            presence: true,
            uniqueness: { scope: :rule_value }

  def self.octicons
    ["file-code", "flame", "heart", "mortar-board", "pulse", "rocket", "ruby"]
  end

  def self.colors
    ["black", "white", "red", "blue", "green", "pink"]
  end

  def self.rules
    { all_categories: 1, all: 2, first_try: 3, all_by_level: 4 }
  end
end
