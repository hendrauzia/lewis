class Tryout < ActiveRecord::Base
  belongs_to :student
  belongs_to :quiz

  validates :score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, only_integer: true }

  before_validation :examine

  def examine
    return unless score.nil?

    quiz_answers = quiz.answers

    correct= 0
    total = quiz_answers.count
    quiz_answers.each { |i, answer| correct+= 1 if answers[i].eql? answer }

    self.score = (correct.to_f / total.to_f * 100).to_i
  end
end
