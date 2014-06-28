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

  describe "GET 'destroy'" do
    before { session[:user_id] = 999 }

    it "remove user session" do
      get 'destroy'
      expect(session[:user_id]).to eq(nil)
    end

    it "redirected to new tryout page" do
      expect(get 'destroy').to redirect_to(new_tryout_path)
    end
  end

end
