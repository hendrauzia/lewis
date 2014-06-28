require 'rails_helper'

describe Tryout, type: :model do
  it { is_expected.to have_db_column(:answers) }
  it { is_expected.to have_db_column(:score) }

  it { is_expected.to belong_to(:student) }
  it { is_expected.to belong_to(:quiz) }

  it { is_expected.to validate_numericality_of(:score).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(100).only_integer }

  before do
    @tryout = Tryout.new
    @tryout.quiz = create(:quiz)
    @tryout.student = create(:student)
    @tryout.quiz.answers = { "1" => "a", "2" => "c", "3" => "b"  }
  end

  describe "#examine" do
    context "has been examined" do
      it "doesn't re-examine" do
        @tryout.answers = { "1" => "a", "2" => "c", "3" => "c" }
        @tryout.examine
        expect(@tryout.score).to eq(66)

        @tryout.answers = { "1" => "a", "2" => "c", "3" => "b" }
        @tryout.examine
        expect(@tryout.score).to eq(66)
      end
    end

    context "no score" do
      it "returns no score" do
        @tryout.answers = { "1" => "b", "2" => "a", "3" => "d" }
        @tryout.examine
        expect(@tryout.score).to eq(0)
      end
    end

    context "rounded down score" do
      it "returns rounded down score" do
        @tryout.answers = { "1" => "a", "2" => "c", "3" => "c" }
        @tryout.examine
        expect(@tryout.score).to eq(66)
      end
    end

    context "perfect score" do
      it "returns perfect score" do
        @tryout.answers = { "1" => "a", "2" => "c", "3" => "b" }
        @tryout.examine
        expect(@tryout.score).to eq(100)
      end
    end

    context "overflown tryout answers" do
      it "examines the first n quiz answers on tryout answers and ignores the rest" do
        @tryout.answers = { "1" => "a", "2" => "c", "3" => "b", "4" => "d" }
        @tryout.examine
        expect(@tryout.score).to eq(100)
      end
    end
  end

  context "before validation" do
    it "examine score" do
      @tryout.answers = { "1" => "b", "2" => "a", "3" => "d" }
      @tryout.save

      expect(@tryout.score).to_not be_nil
    end
  end
end
