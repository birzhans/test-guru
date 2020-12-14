class Badge < ApplicationRecord
  has_and_belongs_to_many :users

  validates :title,
            presence: true,
            uniqueness: true

  validates :octicon,
            presence: true,
            uniqueness: { scope: :color }

  validates :rule,
            presence: true,
            uniqueness: { scope: :rule_value }

  validate :validate_rule_value

  def self.octicons
    ["file-code", "flame", "heart", "mortar-board", "pulse", "rocket", "ruby"]
  end

  def self.colors
    ["black", "white", "red", "blue", "green", "pink"]
  end

  def self.rules
    ["all_by_category", "all_tests", "first_try", "all_by_level"]
  end

  private

  def validate_rule_value

  end
end
