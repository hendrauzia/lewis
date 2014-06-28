class Tryout < ActiveRecord::Base
  belongs_to :student
  belongs_to :quiz

  validates :score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, only_integer: true }
end
