require 'rails_helper'

describe "tryouts/new.html.slim", type: :view do
  before do
    @quiz = build(:quiz)
    @quiz.description = "Some quiz description in here"

    assign(:quiz, @quiz)
  end

  it "renders quiz name and description" do
    render
    expect(rendered).to have_content(@quiz.name)
    expect(rendered).to have_content(@quiz.description)
  end

  context "user not signed in" do
    it "see email field" do
      render
      expect(rendered).to have_content("Email")
    end

    it "doesn't see profile link" do
      render
      expect(rendered).to_not have_content("Profile")
    end
  end

  context "user signed in" do
    before do
      session[:user_id] = 999
    end

    it "doesn't see email field" do
      render
      expect(rendered).to_not have_content("Email")
    end

    it "see profile link" do
      render
      expect(rendered).to have_content("Profile")
    end
  end
end
