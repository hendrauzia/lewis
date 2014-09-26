require "rails_helper"

describe Examiner do
  def answer_of total, miss
    Hash[ total.times.map{ |n| [ (n + miss).next.to_s, ("a".ord + n + miss).chr ] } ]
  end

  describe ".run" do
    let(:source) { answer_of 10, 0 }
    let(:target) { 11.times.map { |i| answer_of 10, i }}

    it { expect(Examiner.run source, nil).to eq "0/10".to_r }
    it "calculates all score possibilities" do
      11.times { |i| expect(Examiner.run source, target[i]).to eq "#{ 10 - i }/10".to_r }
    end
  end
end
