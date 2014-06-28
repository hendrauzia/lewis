require 'rails_helper'

describe Scholarship, type: :model do
  it { is_expected.to have_db_column(:score).of_type(:integer) }
  it { is_expected.to have_db_column(:discount).of_type(:float) }

  it { is_expected.to validate_numericality_of(:score).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(100).only_integer }
  it { is_expected.to validate_numericality_of(:discount).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(1) }

  describe ".determine" do
    before do
      @stupid  = Scholarship.find_by_score(0)
      @average = Scholarship.find_by_score(50)
      @smart   = Scholarship.find_by_score(75)
      @genius  = Scholarship.find_by_score(100)
    end

    context "unqualified" do
      it "doesn't qualify scholarship" do
        expect(Scholarship.determine(@average.score - 1).id).to be(@stupid.id)
      end
    end

    context "qualified" do
      it "select the highest qualified scholarship" do
        expect(Scholarship.determine(@smart.score - 1).id).to be(@average.id)
        expect(Scholarship.determine(@genius.score - 1).id).to be(@smart.id)
        expect(Scholarship.determine(@genius.score).id).to be(@genius.id)
      end
    end
  end
end
