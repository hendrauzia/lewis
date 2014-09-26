class Tryout < ActiveRecord::Base
  belongs_to :student
  belongs_to :quiz

  before_save :examine, :determine_scholarship

  protected
  def examine
    self.score = ((Examiner.run quiz.answers, self.answers).to_f * 100).to_i
  end

  def determine_scholarship
    self.discount = Scholarship.determine(self.score).discount
  end
end
