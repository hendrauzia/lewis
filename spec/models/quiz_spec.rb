require 'rails_helper'

describe Quiz, type: :model do
  it { is_expected.to have_db_column(:name).of_type(:string) }
  it { is_expected.to have_db_column(:description).of_type(:string) }
  it { is_expected.to have_db_column(:questions).of_type(:json) }
  it { is_expected.to have_db_column(:answers).of_type(:json) }
  it { is_expected.to have_db_column(:published).of_type(:boolean).with_options(default: false) }
  it { is_expected.to have_many(:tryouts) }
  it { is_expected.to validate_presence_of(:name) }

  describe ".published" do
    it "returns published quizzes" do
      published_quiz = create(:quiz)
      expect(Quiz.published).to include(published_quiz)
    end

    it "does not return unpublished quizzes" do
      unpublished_quiz = build(:quiz)
      unpublished_quiz.update_attribute(:published, false)
      expect(Quiz.published).not_to include(unpublished_quiz)
    end
  end
end
