class Tryout < ActiveRecord::Base
  belongs_to :student
  belongs_to :quiz

  before_validation :examine, :determine_scholarship

  def examine(answers = self.answers)
    return unless self.score.nil?
    return if self.quiz.nil?

    self.answers = answers
    quiz_answers = self.quiz.answers

    correct = 0
    total = quiz_answers.count
    quiz_answers.each { |i, answer| correct += 1 if self.answers[i].eql? answer }

    self.score = (correct.to_f / total.to_f * 100).to_i
  end

  def determine_scholarship
    self.discount = Scholarship.determine(self.score).discount
  end
end
