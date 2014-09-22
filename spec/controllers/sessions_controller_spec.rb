require 'rails_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    before { @user = create(:user) }

    context "valid" do
      before do
        post 'create', email: @user.email, password: "password"
      end

      it "save session" do
        expect(session[:user_id]).to eq(@user.id)
      end

      it "redirect to profile" do
        expect(response).to redirect_to(profile_path)
      end
    end

    context "invalid" do
      before do
        post 'create', email: @user.email, password: "invalid password"
      end

      it "doesn't save session" do
        expect(session[:user_id]).to eq(nil)
      end

      it "redirect to login" do
        expect(response).to redirect_to(new_session_path)
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
      expect(get 'destroy').to redirect_to(new_session_path)
    end
  end

end
