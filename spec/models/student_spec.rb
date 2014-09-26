require 'rails_helper'

describe Student do
  it_behaves_like User

  it { is_expected.to have_many(:tryouts) }
  it { is_expected.to have_many(:parents).through(:families) }

  describe "#discount" do
    let(:student) { create :student }

    context "had no tryout" do
      it { expect(student.discount).to eq(0) }
    end

    context "had tryout" do
      let(:quiz) { create :quiz }

      context "1 tryout" do
        let!(:tryout) { create :tryout, :average_score, student: student, quiz: quiz }

        it { expect(student.discount).to eq tryout.discount }
      end

      context "more than 1 tryout" do
        let!(:tryout_average) { create :tryout, :average_score, student: student, quiz: quiz }
        let!(:tryout_perfect) { create :tryout, :perfect_score, student: student, quiz: quiz }

        it { expect(student.discount).to eq tryout_perfect.discount }
      end
    end
  end
end
