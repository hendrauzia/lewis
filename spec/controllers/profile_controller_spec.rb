require 'rails_helper'

describe ProfileController, type: :controller do
  it_behaves_like "Authenticatable"

  context "parent" do
    before do
      @parent = create(:parent)
      session[:user_id] = @parent.id
    end

    describe "GET index" do
      it "returns https success" do
        get 'index'
        expect(response).to be_success
      end
    end
  end

  context "student" do
    before do
      @student = create(:student)
      session[:user_id] = @student.id
    end

    describe "GET index" do
      it "returns https success" do
        get 'index'
        expect(response).to be_success
      end
    end

    describe "GET share_profile" do
      it "returns http success" do
        get 'share'
        expect(response).to be_success
      end
    end

    describe "POST notify_profile" do
      it "redirects to profile" do
        post 'notify'
        expect(response).to redirect_to(profile_path)
      end

      it "assign student as parent's child" do
        post 'notify', email: 'parent@lol.lol'
        expect(@student.parents.exists?(email: 'parent@lol.lol')).to be(true)
      end
    end
  end
end
