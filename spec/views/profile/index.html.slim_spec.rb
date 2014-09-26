require 'rails_helper'

describe "profile/index.html.slim" do
  context "student" do
    let(:student) { create :student }
    let(:user)    { student }
    let(:quiz)    { create :quiz }
    let(:tryouts) { student.tryouts }
    let!(:tryout_no_score) { create :tryout, :no_score, student: student, quiz: quiz }
    let!(:tryout_perfect_score) { create :tryout, :perfect_score, student: student, quiz: quiz }

    before do
      assign :tryouts, tryouts
      assign :student, student
      assign :user, user
      render
    end

    it { expect(rendered).to have_content user.first_name }
    it { expect(rendered).to have_content "#{student.tryouts.count} tryout" }
    it { expect(rendered).to have_content "Beasiswa yang didapat: #{student.discount * 100}%" }
    it { expect(rendered).to have_content "Skor: #{tryouts.first.score}" }
  end

  context "parent" do
    let(:student) { create :student }
    let(:parent)  { create :parent }
    let!(:family)  { create :family, student: student, parent: parent }

    before do
      assign :user, parent
      render
    end

    it { expect(rendered).not_to have_content "tryout" }
    it { expect(rendered).to have_content family.student.first_name }
    it { expect(rendered).to have_content "#{family.student.discount * 100}%" }
  end
end
