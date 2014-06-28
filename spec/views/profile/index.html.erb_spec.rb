require 'rails_helper'

describe "profile/index.html.erb", type: :view do
  shared_examples "user profile" do
    it "renders user first name" do
      render
      expect(rendered).to have_content(@user.first_name)
    end
  end

  context "student" do
    before do
      @student = create(:student)
      @user = @student

      create(:tryout, :no_score, student_id: @student.id)
      create(:tryout, :perfect_score, student_id: @student.id)

      @tryouts = @student.tryouts
      assign(:tryouts, @tryouts)
      assign(:student, @student)
    end

    it_behaves_like "user profile"

    it "see total tryouts taken" do
      render
      expect(rendered).to have_content("#{@student.tryouts.count} tryout")
    end

    pending "see scholarship"
    pending "see list of tryout scores"
  end

  context "parent" do
    pending "see list of childrens"
    pending "see children's scholarship"
  end
end
