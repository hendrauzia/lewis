require 'rails_helper'

RSpec.describe "Tryouts", type: :request do
  describe "GET /tryouts/show/:id(.:format)" do
    it "returns 200" do
      quiz = create(:quiz)
      get tryout_path(quiz.id)
      expect(response.status).to be(200)
    end
  end
end
