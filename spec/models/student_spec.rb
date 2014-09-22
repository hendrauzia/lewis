require 'rails_helper'

describe Student do
  it_behaves_like User

  it { is_expected.to have_many(:tryouts) }
  it { is_expected.to have_many(:parents).through(:families) }

  describe "#discount" do
    before do
      @student = create(:student)
    end

    context "had no tryout" do
      it "returns no discount" do
        expect(@student.discount).to eq(0)
      end
    end

    context "had tryout" do
      context "1 tryout" do
        before do
          @tryout = create(:tryout, :average_score, student_id: @student.id)
        end

        it "returns discount" do
          expect(@student.discount).to eq(@tryout.discount)
        end
      end

      context "more than 1 tryout" do
        before do
          create(:tryout, :average_score, student_id: @student.id)
          @tryout = create(:tryout, :perfect_score, student_id: @student.id)
        end

        it "returns the highest discount" do
          expect(@student.discount).to eq(@tryout.discount)
        end
      end
    end
  end
end
