require 'rails_helper'

describe TryoutsController, type: :controller do

  describe "GET 'new'" do
    before { @quiz = create(:quiz) }
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

end
