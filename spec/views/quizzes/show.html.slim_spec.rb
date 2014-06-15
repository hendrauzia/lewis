require 'rails_helper'

describe "quizzes/show.html.slim", type: :view do
  it "renders quiz name and description" do
    quiz = build(:quiz)
    quiz.description = "Some quiz description in here"
    assign(:quiz, quiz)

    render
    expect(rendered).to have_content quiz.name
    expect(rendered).to have_content quiz.description
  end
end
