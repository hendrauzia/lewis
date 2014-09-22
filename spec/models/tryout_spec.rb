require 'rails_helper'

describe Tryout do
  let(:no_answer)     {{}}
  let(:answer_1_of_3) {{ "1" => "c", "2" => "c", "3" => "c" }}
  let(:answer_2_of_3) {{ "1" => "a", "2" => "c", "3" => "c" }}
  let(:answer_3_of_3) {{ "1" => "a", "2" => "c", "3" => "b" }}
  let(:answer_4_of_3) {{ "1" => "a", "2" => "c", "3" => "b", "4" => "d" }}

  let(:quiz)    { create :quiz, answers: answer_3_of_3}
  let(:student) { create :student }
  let(:tryout)  { build :tryout, quiz: quiz, student: student }

  it { is_expected.to have_db_column(:answers) }
  it { is_expected.to have_db_column(:score) }
  it { is_expected.to have_db_column(:discount) }

  it { is_expected.to belong_to(:student) }
  it { is_expected.to belong_to(:quiz) }

  context "#before_validation" do
    describe "#examine"  do
      let(:scholarship) { double :scholarship, discount: nil }
      before(:each)     { allow(Scholarship).to receive(:determine).and_return scholarship }

      context "has been examined" do
        before { tryout.update(answers: answer_2_of_3) }

        it "doesn't re-examine" do
          expect(tryout.score).to eq 66

          tryout.update(answers: answer_3_of_3)
          expect(tryout.score).to eq 66
        end
      end

      context "no score" do
        before { tryout.update(answers: no_answer) }

        it { expect(tryout.score).to be_zero }
      end

      context "has score" do
        context "1 of 3" do
          before { tryout.update(answers: answer_1_of_3) }

          it { expect(tryout.score).to eq 33 }
        end

        context "2 of 3" do
          before { tryout.update(answers: answer_2_of_3) }

          it { expect(tryout.score).to eq 66 }
        end

        context "3 of 3" do
          before { tryout.update(answers: answer_3_of_3) }

          it { expect(tryout.score).to eq 100 }
        end
      end

      context "too many answers" do
        before { tryout.update(answers: answer_4_of_3) }

        it { expect(tryout.score).to eq 100 }
      end
    end

    describe "determine_scholarship" do
      let(:discount)    { 999 }
      let(:scholarship) { double :scholarship, discount: discount }

      before do
        allow(Scholarship).to receive(:determine).and_return scholarship
        tryout.update(answers: no_answer)
      end

      it { expect(tryout.discount).to eq discount }
    end
  end
end
