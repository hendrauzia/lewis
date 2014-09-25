class Scholarship < ActiveRecord::Base
  validates :score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, only_integer: true }
  validates :discount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }

  class << self
    def determine(value)
      value = 0 if value.to_i < 0
      where(score: 0..(value.to_i)).order(score: :desc).first
    end
  end
end
