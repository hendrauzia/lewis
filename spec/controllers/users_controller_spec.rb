require 'rails_helper'

describe UsersController do
  describe "GET 'invite'" do
    context "email exists" do
      it "returns http success" do
        parent = create(:parent)
        get 'invite', email: parent.email
        expect(response).to be_success
      end
    end

    context "email doesn't exists" do
      it "returns http not found" do
        expect{ get 'invite', email: 'not-exist' }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "PATCH 'update'" do
    context "email doesn't exists" do
      it "returns http not found" do
        expect{ patch 'update', email: 'not-exist' }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context "invalid request" do
      it "redirects to invite user" do
        parent = create(:parent)
        patch 'update', { email: parent.email, first_name: nil }
        expect(response).to redirect_to(invite_user_path)
      end
    end

    context "valid request" do
      before do
        @parent = create(:parent)
        patch 'update', {
          email: @parent.email,
          first_name: @parent.first_name,
          last_name: '',
          password: "password",
          password_confirmation: "password"
        }
      end

      it "automatically sign in" do
        expect(session[:user_id]).to eq(@parent.id)
      end

      it "redirect to profile index" do
        expect(response).to redirect_to(profile_path)
      end
    end
  end
end
