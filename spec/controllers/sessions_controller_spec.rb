require 'rails_helper'

describe SessionsController, type: :controller do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    before { @user = create(:user) }

    context "valid" do
      it "save session" do
        post 'create', email: @user.email, password: "password"
        expect(session[:user_id]).to eq(@user.id)
      end
    end

    context "invalid" do
      it "doesn't save session" do
        post 'create', email: @user.email, password: "invalid password"
        expect(session[:user_id]).to eq(nil)
      end
    end
  end

end
