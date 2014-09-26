require 'rails_helper'

describe SessionsController do

  describe "GET 'new'" do
    before { get :new }

    it { expect(response).to be_success }
  end

  describe "POST 'create'" do
    let(:user) { create :user, password: "password" }

    context "valid" do
      before(:each) { post :create, email: user.email, password: "password" }

      it { expect(session[:user_id]).to eq user.id }
      it { expect(response).to redirect_to(profile_path) }
    end

    context "invalid" do
      before(:each) { post :create, email: user.email, password: "invalid" }

      it { expect(session[:user_id]).to eq nil }
      it { expect(response).to redirect_to new_session_path }
    end
  end

  describe "GET 'destroy'" do
    before(:each) do
      session[:user_id] = 999
      get :destroy
    end

    it { expect(session[:user_id]).to eq nil }
    it { expect(response).to redirect_to new_session_path }
  end

end
