require 'rails_helper'

describe Tryout, type: :model do
  it { is_expected.to have_db_column(:answers) }
  it { is_expected.to have_db_column(:score) }
  it { is_expected.to have_db_column(:discount) }

  it { is_expected.to belong_to(:student) }
  it { is_expected.to belong_to(:quiz) }

  before do
    @tryout = Tryout.new
    @tryout.quiz = create(:quiz)
    @tryout.student = create(:student)
    @tryout.quiz.answers = { "1" => "a", "2" => "c", "3" => "b"  }
  end

  describe "#examine" do
    context "has been examined" do
      it "doesn't re-examine" do
        @tryout.examine({ "1" => "a", "2" => "c", "3" => "c" })
        expect(@tryout.score).to eq(66)

        @tryout.examine({ "1" => "a", "2" => "c", "3" => "b" })
        expect(@tryout.score).to eq(66)
      end
    end

    context "no score" do
      it "returns no score" do
        @tryout.examine({ "1" => "b", "2" => "a", "3" => "d" })
        expect(@tryout.score).to eq(0)
      end
    end

    context "rounded down score" do
      it "returns rounded down score" do
        @tryout.examine({ "1" => "a", "2" => "c", "3" => "c" })
        expect(@tryout.score).to eq(66)
      end
    end

    context "perfect score" do
      it "returns perfect score" do
        @tryout.examine({ "1" => "a", "2" => "c", "3" => "b" })
        expect(@tryout.score).to eq(100)
      end
    end

    context "overflown tryout answers" do
      it "examines the first n quiz answers on tryout answers and ignores the rest" do
        @tryout.examine({ "1" => "a", "2" => "c", "3" => "b", "4" => "d" })
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

    it "determine scholarship" do
      @tryout.answers = { "1" => "b", "2" => "a", "3" => "d" }
      @tryout.save

      expect(@tryout.discount).to_not be_nil
    end
  end
end
