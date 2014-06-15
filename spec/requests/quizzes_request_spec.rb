require 'rails_helper'

RSpec.describe "Quizzes", type: :request do
  describe "GET /quizzes/show/:id(.:format)" do
    it "returns 200" do
      quiz = create(:quiz)
      get quiz_path(quiz.id)
      expect(response.status).to be(200)
    end
  end
end
