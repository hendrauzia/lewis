require 'rails_helper'

describe Tryout do
  it { is_expected.to have_db_column(:answers) }
  it { is_expected.to have_db_column(:score) }
  it { is_expected.to have_db_column(:discount) }

  it { is_expected.to belong_to(:student) }
  it { is_expected.to belong_to(:quiz) }

  describe "#before_save" do
    let(:student) { create :student }
    let(:quiz)    { create :quiz}
    let(:tryout)  { build :tryout, quiz: quiz, student: student }

    describe "#examine" do
      before do
        allow(Examiner).to receive(:run).and_return "8/10".to_r
        tryout.save
      end

      it { expect(tryout.score).to eq 80 }
    end

    describe "#determine_scholarship" do
      let(:discount)    { 999 }
      let(:scholarship) { double :scholarship, discount: discount }

      before do
        allow(Scholarship).to receive(:determine).and_return scholarship
        tryout.save
      end

      it { expect(tryout.discount).to eq discount }
    end
  end
end
