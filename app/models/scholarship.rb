class Scholarship < ActiveRecord::Base
  validates :score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, only_integer: true }
  validates :discount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
end
