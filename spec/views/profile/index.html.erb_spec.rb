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

    it "see scholarship" do
      render
      expect(rendered).to have_content("Beasiswa yang didapat: #{@student.discount * 100}%")
    end

    it "see list of tryout scores" do
      render
      expect(rendered).to have_content("Skor: #{@tryouts.first.score}")
    end
  end

  context "parent" do
    before do
      @parent = create(:parent)
      @user = @parent
    end

    it "doesn't see total tryout" do
      render
      expect(rendered).to_not have_content("tryout")
    end

    pending "see list of childrens"
    pending "see children's scholarship"
  end
end
